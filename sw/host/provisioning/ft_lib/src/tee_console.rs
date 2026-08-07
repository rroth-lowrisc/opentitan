// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

//! A console device that serves the provisioning flow's SPI console while also
//! forwarding the DUT's UART0 output to the log.
//!
//! The provisioning flow talks to the DUT over the SPI console, but the ROM and
//! ROM_EXT print over UART0 (see `base_set_stdout()` in `rom.c`). Without this
//! wrapper, anything those stages print is invisible to `ft`, which makes a
//! hang before the personalization firmware starts very hard to diagnose: all
//! you see is a `wait_for` timing out.
//!
//! Reads of the UART are opportunistic. Every time the flow polls the SPI
//! console we first drain whatever UART0 has produced and log it line by line,
//! then serve the caller from the SPI console. Both devices register their
//! waker, so a poll that finds neither ready still wakes on traffic from
//! either.

use std::cell::RefCell;
use std::rc::Rc;
use std::task::{Context, Poll};

use anyhow::Result;

use opentitanlib::console::spi::SpiConsoleDevice;
use opentitanlib::io::console::ConsoleDevice;
use opentitanlib::io::uart::Uart;

/// Prefix applied to every line forwarded from the DUT's UART0.
const LOG_PREFIX: &str = "dut-uart";

pub struct TeeConsole<'a> {
    spi: &'a SpiConsoleDevice<'a>,
    uart: Rc<dyn Uart>,
    /// Bytes received from the UART that do not yet form a complete line.
    partial: RefCell<Vec<u8>>,
}

impl<'a> TeeConsole<'a> {
    /// Wraps `spi`, additionally logging everything the DUT prints on `uart`.
    ///
    /// `uart` should be the transport's `console` UART. Note that the transport
    /// caches UART instances, so this shares the handle that `TransportWrapper`
    /// itself uses when clearing the RX buffer on reset; it does not open (and
    /// therefore does not `flock`) the underlying serial port a second time.
    pub fn new(spi: &'a SpiConsoleDevice<'a>, uart: Rc<dyn Uart>) -> Self {
        Self {
            spi,
            uart,
            partial: RefCell::new(Vec::new()),
        }
    }

    /// Forwards the SPI console's frame counter reset.
    pub fn reset_frame_counter(&self) {
        self.spi.reset_frame_counter()
    }

    /// Logs any complete lines in `data`, holding back a trailing partial line.
    fn log_uart_bytes(&self, data: &[u8]) {
        let mut partial = self.partial.borrow_mut();
        partial.extend_from_slice(data);

        // `drain(..=idx)` keeps the tail, so repeated calls stitch together
        // lines that arrive split across reads.
        while let Some(idx) = partial.iter().position(|&b| b == b'\n') {
            let line: Vec<u8> = partial.drain(..=idx).collect();
            let line = String::from_utf8_lossy(&line);
            let line = line.trim_end_matches(['\r', '\n']);
            if !line.is_empty() {
                log::info!("[{LOG_PREFIX}] {line}");
            }
        }
    }

    /// Logs a trailing partial line, if any.
    ///
    /// A hang typically leaves the most interesting output unterminated, so this
    /// is called on drop to make sure it is not swallowed.
    pub fn flush(&self) {
        let mut partial = self.partial.borrow_mut();
        if partial.is_empty() {
            return;
        }
        let line = String::from_utf8_lossy(&partial);
        let line = line.trim_end_matches(['\r', '\n']);
        if !line.is_empty() {
            log::info!("[{LOG_PREFIX}] {line}");
        }
        partial.clear();
    }
}

impl Drop for TeeConsole<'_> {
    fn drop(&mut self) {
        self.flush();
    }
}

impl ConsoleDevice for TeeConsole<'_> {
    fn poll_read(&self, cx: &mut Context<'_>, buf: &mut [u8]) -> Poll<Result<usize>> {
        let mut uart_buf = [0u8; 256];
        loop {
            match self.uart.poll_read(cx, &mut uart_buf) {
                Poll::Ready(Ok(0)) | Poll::Pending => break,
                Poll::Ready(Ok(n)) => self.log_uart_bytes(&uart_buf[..n]),
                Poll::Ready(Err(e)) => {
                    // The UART is only a diagnostic aid here; losing it must not
                    // take down the provisioning flow.
                    log::warn!("Error reading the DUT UART console: {e:#}");
                    break;
                }
            }
        }

        self.spi.poll_read(cx, buf)
    }

    fn write(&self, buf: &[u8]) -> Result<()> {
        self.spi.write(buf)
    }
}
