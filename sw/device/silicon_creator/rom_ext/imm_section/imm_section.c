// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/silicon_creator/rom_ext/imm_section/imm_section.h"

#include "sw/device/lib/arch/device.h"
#include "sw/device/lib/base/hardened.h"
#include "sw/device/lib/base/macros.h"
#include "sw/device/lib/coverage/api.h"
#include "sw/device/silicon_creator/lib/drivers/keymgr_dpe.h"
#include "sw/device/silicon_creator/lib/base/boot_measurements.h"
#include "sw/device/silicon_creator/lib/base/sec_mmio.h"
#include "sw/device/silicon_creator/lib/cert/dice_chain.h"
#include "sw/device/silicon_creator/lib/drivers/rnd.h"
#include "sw/device/silicon_creator/lib/epmp_state.h"
#include "sw/device/silicon_creator/lib/error.h"
#include "sw/device/silicon_creator/lib/manifest.h"
#include "sw/device/silicon_creator/lib/nvm_ctrl.h"
#include "sw/device/silicon_creator/lib/ownership/ownership_key.h"
#include "sw/device/silicon_creator/rom_ext/imm_section/imm_section_epmp.h"
#include "sw/device/silicon_creator/rom_ext/rom_ext_manifest.h"

/**
 * Keymgr dpe constant
 */
// TODO(#30777): Replace the hard-coded slot number
// Slot Number must match with the ones defined in dice_chain.c!
// Pre-defined slot id for the attestation / sealing key chain
const uint32_t kKeymgrDPESealSlot = 0;
const uint32_t kKeymgrDPEAttestSlot = 1;
const sc_keymgr_dpe_policies_t kKeymgrDPEDefaultPolicy = {
    .child = kScKeymgrDPESlotPolAllowChild,
    .expo = kScKeymgrDPESlotPolNoExport,
    .parent = kScKeymgrDPESlotPolEraseParent,
};


OT_WARN_UNUSED_RESULT
static rom_error_t imm_section_start(void) {
  // Check the ePMP state.
  HARDENED_RETURN_IF_ERROR(epmp_state_check());
  // Check sec_mmio expectations.
  // We don't check the counters since we don't want to tie ROM_EXT to a
  // specific ROM version.
  sec_mmio_check_values(rnd_uint32());

  // Initialize Immutable ROM EXT.
  sec_mmio_next_stage_init();
  HARDENED_RETURN_IF_ERROR(imm_section_epmp_reconfigure());

  // Establish our identity.
  const manifest_t *rom_ext = rom_ext_manifest();

  // Sideload sealing key to KMAC hw keyslot.
  HARDENED_RETURN_IF_ERROR(ownership_seal_init());

  // Lockdown the attestation seed to readonly as soon as possible to prevent
  // key tampering and exfiltration.
  nvm_ctrl_cert_info_page_creator_cfg(kNvmInfoPageAttestationKeySeeds);
  nvm_ctrl_cert_info_page_owner_restrict(kNvmInfoPageAttestationKeySeeds);
  nvm_ctrl_info_cfg_lock(kNvmInfoPageAttestationKeySeeds);

  // TODO(#30811): Read DISABLE_KEYMGR_DPE field to jump the CreatorRootKey generation in the ROM section.
  if(true){

    // TODO(rroth): The keymgr_dpe can not be started in all lc states! The reason
    // is the lcmgr enables the keymgr_dpe only in the Dev, Prod, ProdEnd, Rma tests
    switch (launder32(lifecycle_state_get())) {
      case kLcStateDev:
      case kLcStateProd:
      case kLcStateProdEnd:
      case kLcStateRma:
        // Generate the certificate related to UDS
        HARDENED_RETURN_IF_ERROR(dice_chain_attestation_creator_keygen());

        // Sideload sealing key to KMAC hw keyslot.
        HARDENED_RETURN_IF_ERROR(ownership_seal_init());

        dice_chain_init();
        dice_chain_immutable_section_check();

        // The keymgr_dpe has loaded the attestation and sealing CreatorRootKey
        // inside the designated slots
        HARDENED_RETURN_IF_ERROR(
            dice_chain_attestation_owner_int(&boot_measurements.rom_ext, rom_ext));

        // TODO(#30759): Verify the kKeymgrDPESealSlot / kKeymgrDPEAttestSlot hold keys
        // with boot stage set to BootStageOwner (2). (Note: Current bootstage + 1)
        break;
      default:
        // TODO(rroth): What should we do in the case where the keymgr_dpe is not enabled?
        // Problematic as otherwise the ROM could be bricked!
        break;
    }
  } else {
    // TODO(#30811): Fallback solution: Only generate the attestation CreatorRootKey here
    // 1. Start the entropy complex
    // 2. load the UDS
    // 3. Generate the attestation Creator Root Key
    // 4. Generate the attestation Owner Int Key
    // 5. Generate the sealing Owner Int Key (Base: either att. Creator Root Key or UDS)
  }

  // Make mutable part executable.
  HARDENED_RETURN_IF_ERROR(imm_section_epmp_mutable_rx(rom_ext));

  return kErrorOk;
}

void imm_section_main(void) {
  rom_error_t error = imm_section_start();

  // If there's an error, this hardened check will trigger the irq handler
  // in ROM to shutdown.
  HARDENED_CHECK_EQ(error, kErrorOk);

  coverage_report();
  coverage_invalidate();

  // Go back to ROM / Mutable ROM_EXT.
  return;
}
