// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdbool.h>
#include <stdint.h>

#include "hw/top/dt/keymgr_dpe.h"  // Generated.
#include "sw/device/lib/base/bitfield.h"
#include "sw/device/lib/base/mmio.h"
#include "sw/device/lib/dif/dif_keymgr_dpe.h"
#include "sw/device/lib/dif/dif_kmac.h"
#include "sw/device/lib/runtime/hart.h"
#include "sw/device/lib/runtime/log.h"
#include "sw/device/lib/testing/keymgr_dpe_testutils.h"
#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_alerts.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"

#include "hw/top/keymgr_dpe_regs.h"  // Generated.

OTTF_DEFINE_TEST_CONFIG();

enum {
  /** Number of words of a generated SW key. */
  kKeyNumWords = 8,
  /**
   * Slots used by this test. The testutils startup (and the ROM) only make
   * use of slot 0 and 1.
   */
  kRootKeySlot = 2,
  kSecondaryRootKeySlot = 3,
  /** Time to wait for an expected alert to be caught by OTTF. */
  kAlertPropagationMicros = 10,
};

static dif_kmac_t kmac;
static dif_keymgr_dpe_t keymgr_dpe;

// Must be called before issuing an operation that is expected to be rejected,
// so that the OTTF alert catcher does not fail the test.
static void expect_error_start(void) {
  CHECK_STATUS_OK(
      ottf_alerts_expect_alert_start(dt_keymgr_dpe_alert_to_alert_id(
          kDtKeymgrDpe, kDtKeymgrDpeAlertRecovOperationErr)));
}

// Wait until the issued operation completes. If `expect_error` is set, the
// operation must be rejected as invalid without changing the keymgr dpe state.
static void wait_op_done(bool expect_error) {
  dif_keymgr_dpe_status_codes_t status;
  do {
    CHECK_DIF_OK(dif_keymgr_dpe_get_status_codes(&keymgr_dpe, &status));
  } while (status == 0);

  if (expect_error) {
    CHECK(status == (kDifKeymgrDpeStatusCodeIdle |
                     kDifKeymgrDpeStatusCodeInvalidOperation),
          "Expected an invalid operation, got status: %x", status);
    // Give the alert some time to propagate to the OTTF alert catcher.
    busy_spin_micros(kAlertPropagationMicros);
    CHECK_STATUS_OK(
        ottf_alerts_expect_alert_finish(dt_keymgr_dpe_alert_to_alert_id(
            kDtKeymgrDpe, kDtKeymgrDpeAlertRecovOperationErr)));
  } else {
    CHECK(status == kDifKeymgrDpeStatusCodeIdle, "Unexpected status: %x",
          status);
  }
  CHECK_STATUS_OK(keymgr_dpe_testutils_check_state(
      &keymgr_dpe, kDifKeymgrDpeStateAvailable));
}

// Load the (creator) root key into the specified slot
static void load_root_key(uint32_t slot, bool expect_error) {
  if (expect_error) {
    expect_error_start();
  }
  CHECK_DIF_OK(dif_keymgr_dpe_load_root_key(&keymgr_dpe, slot));
  wait_op_done(expect_error);
}

// Load the secondary root key into the specified slot
static void load_secondary_root_key(uint32_t slot, bool expect_error) {
  if (expect_error) {
    expect_error_start();
  }
  CHECK_DIF_OK(dif_keymgr_dpe_load_secondary_root_key(&keymgr_dpe, slot));
  wait_op_done(expect_error);
}

static void erase_slot(uint32_t slot) {
  dif_keymgr_dpe_erase_params_t params = {.slot_dst_sel = slot};
  CHECK_STATUS_OK(keymgr_dpe_testutils_erase_slot(&keymgr_dpe, &params));
}

// Advance the given slot in place. The same parameters are used for every
// slot, so that only the root key differs between the derived DPE contexts.
static void advance(uint32_t slot) {
  dif_keymgr_dpe_advance_params_t params = kCreatorRootKeyParams;
  params.slot_src_sel = slot;
  params.slot_dst_sel = slot;
  CHECK_STATUS_OK(keymgr_dpe_testutils_advance_state(&keymgr_dpe, &params));
  CHECK_STATUS_OK(keymgr_dpe_testutils_check_state(
      &keymgr_dpe, kDifKeymgrDpeStateAvailable));
}

// Generate a SW key from the given slot and return the unmasked key. The same
// parameters are used for every slot.
static void generate_sw_key(uint32_t slot, uint32_t key[kKeyNumWords]) {
  dif_keymgr_dpe_generate_params_t params = kKeyVersionedParams;
  params.slot_src_sel = slot;
  CHECK_STATUS_OK(keymgr_dpe_testutils_generate_key(&keymgr_dpe, &params));

  dif_keymgr_dpe_output_t output;
  CHECK_DIF_OK(dif_keymgr_dpe_read_output(&keymgr_dpe, &output));
  for (size_t i = 0; i < kKeyNumWords; ++i) {
    key[i] = output.value[0][i] ^ output.value[1][i];
  }
}

bool test_main(void) {
  uint32_t root_child_key[kKeyNumWords];
  uint32_t secondary_child_key[kKeyNumWords];
  uint32_t reloaded_child_key[kKeyNumWords];

  CHECK_STATUS_OK(keymgr_dpe_testutils_startup(&keymgr_dpe, &kmac));
  CHECK_STATUS_OK(keymgr_dpe_testutils_check_state(
      &keymgr_dpe, kDifKeymgrDpeStateAvailable));

  // Load both root keys into empty slots.
  load_root_key(kRootKeySlot, /*expect_error=*/false);
  load_secondary_root_key(kSecondaryRootKeySlot, /*expect_error=*/false);
  LOG_INFO("Loaded the root key and the secondary root key");

  // The destination slot must be empty.
  load_secondary_root_key(kSecondaryRootKeySlot, /*expect_error=*/true);
  LOG_INFO("Loading into an occupied slot was rejected");

  // Keys derived with the same parameters from the two root keys must differ.
  advance(kRootKeySlot);
  advance(kSecondaryRootKeySlot);
  generate_sw_key(kRootKeySlot, root_child_key);
  generate_sw_key(kSecondaryRootKeySlot, secondary_child_key);
  CHECK_ARRAYS_NE(root_child_key, secondary_child_key, kKeyNumWords);
  LOG_INFO("Keys derived from the two root keys differ");

  // Reloading the secondary root key must result in the same derived key.
  erase_slot(kSecondaryRootKeySlot);
  load_secondary_root_key(kSecondaryRootKeySlot, /*expect_error=*/false);
  advance(kSecondaryRootKeySlot);
  generate_sw_key(kSecondaryRootKeySlot, reloaded_child_key);
  CHECK_ARRAYS_EQ(reloaded_child_key, secondary_child_key, kKeyNumWords);
  LOG_INFO("Reloading the secondary root key reproduced the derived key");

  // Once locked, the root key can no longer be loaded.
  CHECK_DIF_OK(dif_keymgr_dpe_lock_root_key(&keymgr_dpe));
  erase_slot(kRootKeySlot);
  load_root_key(kRootKeySlot, /*expect_error=*/true);
  LOG_INFO("Loading the locked root key was rejected");

  // Once locked, the secondary root key can no longer be loaded.
  CHECK_DIF_OK(dif_keymgr_dpe_lock_secondary_root_key(&keymgr_dpe));
  erase_slot(kSecondaryRootKeySlot);
  load_secondary_root_key(kSecondaryRootKeySlot, /*expect_error=*/true);
  LOG_INFO("Loading the locked secondary root key was rejected");

  return true;
}
