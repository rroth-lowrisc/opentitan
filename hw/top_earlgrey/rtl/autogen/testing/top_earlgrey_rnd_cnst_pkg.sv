// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_earlgrey/data/top_earlgrey.hjson
//                -o hw/top_earlgrey/
//
// File is generated based on the following seed configuration:
//   hw/top_earlgrey/data/top_earlgrey_seed.testing.hjson


package top_earlgrey_rnd_cnst_pkg;

  ////////////////////////////////////////////
  // otp_ctrl
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter otp_ctrl_top_specific_pkg::lfsr_seed_t RndCnstOtpCtrlLfsrSeed = {
    40'h77_D9071BEC
  };

  // Compile-time random permutation for LFSR output
  parameter otp_ctrl_top_specific_pkg::lfsr_perm_t RndCnstOtpCtrlLfsrPerm = {
    240'h8872_DE58484F_26071301_B0514905_54688399_60232618_37DD5C59_0A8CD9E5
  };

  // Compile-time random permutation for scrambling key/nonce register reset value
  parameter otp_ctrl_top_specific_pkg::scrmbl_key_init_t RndCnstOtpCtrlScrmblKeyInit = {
    256'h010CB666_A5E22D33_20F89CAA_47E5CED5_D29CC9CD_B468773E_BACEC14D_A34C505A
  };

  // Compile-time scrambling key
  parameter otp_ctrl_top_specific_pkg::key_t RndCnstOtpCtrlScrmblKey0 = {
    128'h008E023B_1E052DAC_1E0FCEBE_AC537EDC
  };

  // Compile-time scrambling key
  parameter otp_ctrl_top_specific_pkg::key_t RndCnstOtpCtrlScrmblKey1 = {
    128'h7848DA13_345040C2_95FCBD76_684E7170
  };

  // Compile-time scrambling key
  parameter otp_ctrl_top_specific_pkg::key_t RndCnstOtpCtrlScrmblKey2 = {
    128'h57AF0328_8E6C3C38_3A73E698_950BFAB6
  };

  // Compile-time digest const
  parameter otp_ctrl_top_specific_pkg::digest_const_t RndCnstOtpCtrlDigestConst0 = {
    128'hEA1EA059_DC5C584C_99E3E946_397824F3
  };

  // Compile-time digest const
  parameter otp_ctrl_top_specific_pkg::digest_const_t RndCnstOtpCtrlDigestConst1 = {
    128'hC0A5A56F_968FD7E9_8071EF1B_FF0C99F0
  };

  // Compile-time digest const
  parameter otp_ctrl_top_specific_pkg::digest_const_t RndCnstOtpCtrlDigestConst2 = {
    128'hC02ABD64_5FC814BC_BC1CFCFF_9F3E4CD4
  };

  // Compile-time digest const
  parameter otp_ctrl_top_specific_pkg::digest_const_t RndCnstOtpCtrlDigestConst3 = {
    128'h2214D762_08E9943A_43242540_D2120889
  };

  // Compile-time digest initial vector
  parameter otp_ctrl_top_specific_pkg::digest_iv_t RndCnstOtpCtrlDigestIV0 = {
    64'h9ACF416A_D5455D1D
  };

  // Compile-time digest initial vector
  parameter otp_ctrl_top_specific_pkg::digest_iv_t RndCnstOtpCtrlDigestIV1 = {
    64'h74E7B5C1_5957663A
  };

  // Compile-time digest initial vector
  parameter otp_ctrl_top_specific_pkg::digest_iv_t RndCnstOtpCtrlDigestIV2 = {
    64'h7A827E95_A7385B32
  };

  // Compile-time digest initial vector
  parameter otp_ctrl_top_specific_pkg::digest_iv_t RndCnstOtpCtrlDigestIV3 = {
    64'hFE6728D0_D0879EC6
  };

  // OTP invalid partition default for buffered partitions
  parameter logic [16383:0] RndCnstOtpCtrlPartInvDefault = {
    704'({
      320'h67BAA00A00025E7FC9BD14102DC30C29978A4C70C8DA26CB202F5F59A412A3392B9403C190120BB3,
      384'h6619E1BBA8167005EE5B59B17EF420135EB6A7B2688A16B1C05693E7E037958183C9545358D14AAED1FCF0E1EDCB0316
    }),
    704'({
      64'h6FD5443C2CB8B75A,
      256'h85CE6F2736649780ACF49BFADF4C4CEF4A487A070E2D41C244CB7240CEE69DF7,
      256'h628838F651B4B5E1188FD88EB8AEB542CC2B9D5A79CA02E338758DD6DE796804,
      128'hFBC75FA47FD1EE356B0EE77C01530CB2
    }),
    704'({
      64'h495CA878EB297504,
      128'h66316FA6C7A2CFE54B57B94CCDB5B701,
      256'h5E895532DB9EF56A3F39ACCE8428CD2F10A9BD8A9D3ADE48339BAB0E6739719D,
      256'hFC60FDA3EC7167EDF9CE31192D35CFE634069D6201333F656283E5A7BD289D1E
    }),
    320'({
      64'h8A8E59E8CC6315D2,
      128'hAD9874386DBD4C92E0F24A7DB2A9D1F7,
      128'hAF22D4755CDDD7CB28EF0FF7219351C5
    }),
    128'({
      64'h2CB21F6ABCDC9A60,
      40'h0, // unallocated space
      8'h69,
      8'h69,
      8'h69
    }),
    576'({
      64'h12107E5F93709238,
      256'hA302E95EC6D2AADEA8B6A9D4477ECD98A528E88DD62172CAFE980B4C39261457,
      256'hE17E956C21B003D0BCB1CBCD1EB02317A6BC237A3081D9BCDD43BA90DE4CF7E1
    }),
    320'({
      64'h44E91725013B44B5,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0
    }),
    3776'({
      64'h171184A5B1C2CBB2,
      256'h0,
      32'h0,
      256'h0,
      32'h0,
      32'h0,
      256'h0,
      32'h0,
      32'h0,
      256'h0,
      32'h0,
      32'h0,
      256'h0,
      32'h0,
      512'h0,
      32'h0,
      512'h0,
      32'h0,
      512'h0,
      32'h0,
      512'h0,
      32'h0
    }),
    5440'({
      64'hA1832965B9E9EB47,
      96'h0, // unallocated space
      768'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      96'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      512'h0,
      128'h0,
      128'h0,
      512'h0,
      2560'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0
    }),
    3200'({
      64'hE7DAA2EA63EA3209,
      64'h0, // unallocated space
      256'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      32'h0,
      1728'h0
    }),
    512'({
      64'h18A937E66A6DF253,
      448'h0
    })
  };

  ////////////////////////////////////////////
  // lc_ctrl
  ////////////////////////////////////////////
  // Diversification value used for all invalid life cycle states.
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivInvalid = {
    128'hEDC70EA1_84C7A341_93D59C73_5B5B4E2C
  };

  // Diversification value used for the TEST_UNLOCKED* life cycle states.
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivTestUnlocked = {
    128'hBEE5AB93_CB024D6F_8C0C7001_10CBF014
  };

  // Diversification value used for the DEV life cycle state.
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivDev = {
    128'h25DAF514_1DF19A88_2A71D66B_5953DBC6
  };

  // Diversification value used for the PROD/PROD_END life cycle states.
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivProduction = {
    128'h03379DA9_EFB2069B_D79815B2_F8D99A40
  };

  // Diversification value used for the RMA life cycle state.
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivRma = {
    128'hE7FDC4FB_13143D77_53CE1CF9_E2029207
  };

  // Compile-time random bits used for invalid tokens in the token mux
  parameter lc_ctrl_pkg::lc_token_mux_t RndCnstLcCtrlInvalidTokens = {
    256'h396945C9_5C9B54BA_E6AEF30D_8577834C_CC6CAAA6_3A8E6604_338151B9_A23C08F9,
    256'hEED04CA1_EBB0BDD3_05FFB6C4_818054E0_E0EDB0AC_D0B040FC_629EA7F8_B17FA88F,
    256'hEE02E3F0_864223A2_E23A8CC3_1E2DE5E5_78D43D2D_CE49E360_CFB594AC_DDF17068,
    256'h4F6EAD2B_7FEBFE89_5523D7BC_4846A485_956C7F90_4B9EDED0_9B89A754_33566F49
  };

  ////////////////////////////////////////////
  // alert_handler
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter alert_handler_pkg::lfsr_seed_t RndCnstAlertHandlerLfsrSeed = {
    32'h63D9DC27
  };

  // Compile-time random permutation for LFSR output
  parameter alert_handler_pkg::lfsr_perm_t RndCnstAlertHandlerLfsrPerm = {
    160'h50182325_0B991C58_B7383D3F_C0CA1BD5_5F71DBBE
  };

  ////////////////////////////////////////////
  // sram_ctrl_ret
  ////////////////////////////////////////////
  // Compile-time random reset value for SRAM scrambling key.
  parameter otp_ctrl_pkg::sram_key_t RndCnstSramCtrlRetSramKey = {
    128'hAF11CDBE_78D67060_615A20B9_C0740F07
  };

  // Compile-time random reset value for SRAM scrambling nonce.
  parameter otp_ctrl_pkg::sram_nonce_t RndCnstSramCtrlRetSramNonce = {
    128'h969CCD2D_10A1A6E7_988FA528_AC032E0A
  };

  // Compile-time random bits for initial LFSR seed
  parameter sram_ctrl_pkg::lfsr_seed_t RndCnstSramCtrlRetLfsrSeed = {
    64'h6138CB83_16FF95C6
  };

  // Compile-time random permutation for LFSR output
  parameter sram_ctrl_pkg::lfsr_perm_t RndCnstSramCtrlRetLfsrPerm = {
    128'h4B07F3FE_B5BA40B8_99BA7F54_2B9218CB,
    256'h7D139478_0D93C3DD_478A8970_E16D13B3_230959AF_85EC46D8_3F8101BB_1AA68D57
  };

  ////////////////////////////////////////////
  // flash_ctrl
  ////////////////////////////////////////////
  // Compile-time random bits for default address key
  parameter flash_ctrl_pkg::flash_key_t RndCnstFlashCtrlAddrKey = {
    128'h87F9F973_DB98AAA2_93568FD1_F31A0165
  };

  // Compile-time random bits for default data key
  parameter flash_ctrl_pkg::flash_key_t RndCnstFlashCtrlDataKey = {
    128'h939D819D_1518690E_6473CDB2_47939163
  };

  // Compile-time random bits for default seeds
  parameter flash_ctrl_top_specific_pkg::all_seeds_t RndCnstFlashCtrlAllSeeds = {
    256'h5057CA10_45B9E191_7E1FF018_9B04A4F7_FBA960FE_098A4FB9_D469171B_950E364B,
    256'h0DAC5469_568E6614_98FD8919_7CCAE8EA_08FF43EF_C2BFB1C6_AB5CC63E_6F4741E8
  };

  // Compile-time random bits for initial LFSR seed
  parameter flash_ctrl_top_specific_pkg::lfsr_seed_t RndCnstFlashCtrlLfsrSeed = {
    64'h0F777CB7_FC05041A
  };

  // Compile-time random permutation for LFSR output
  parameter flash_ctrl_top_specific_pkg::lfsr_perm_t RndCnstFlashCtrlLfsrPerm = {
    128'hA75D93F9_FAC7FE59_C2F23EAD_36FED1E6,
    256'h07400F7C_6441C10C_2B820EC2_C65E8525_41A2EA96_9B32572C_FD0569BF_72518886
  };

  ////////////////////////////////////////////
  // aes
  ////////////////////////////////////////////
  // Default seed of the PRNG used for register clearing.
  parameter aes_pkg::clearing_lfsr_seed_t RndCnstAesClearingLfsrSeed = {
    64'h60653B42_A96F88B5
  };

  // Permutation applied to the LFSR of the PRNG used for clearing.
  parameter aes_pkg::clearing_lfsr_perm_t RndCnstAesClearingLfsrPerm = {
    128'h563918B7_56A10EE9_9FAD95C9_39E0A858,
    256'hDA9CCF19_4AC9BA41_23A412F9_11F7BCB3_FDFF8006_EE29F0F0_4D8CB055_13834E5D
  };

  // Permutation applied to the clearing PRNG output for clearing the second share of registers.
  parameter aes_pkg::clearing_lfsr_perm_t RndCnstAesClearingSharePerm = {
    128'hE82A8545_88C4C7FF_3E82231E_2F234196,
    256'h1DA656D7_391E9A2C_4A7CE424_A1AE68FF_560D0D74_51FDEB38_06EFE192_135F0EDD
  };

  // Default seed of the PRNG used for masking.
  parameter aes_pkg::masking_lfsr_seed_t RndCnstAesMaskingLfsrSeed = {
    32'h81616362,
    256'hB27EAFB9_03EC79BD_DF0A4F7D_FF07DB05_DE63910E_4EE4D8A2_C7D4022F_16ED8A24
  };

  // Permutation applied to the output of the PRNG used for masking.
  parameter aes_pkg::masking_lfsr_perm_t RndCnstAesMaskingLfsrPerm = {
    256'h5019398E_735C2837_3349860F_718F099D_428C314D_1B2D4E94_045B8A96_7E2A1253,
    256'h64607A9E_5F4F7F4C_479C7735_78700262_23146E51_2B971F0A_9B54766A_8B3B0C79,
    256'h46931774_5A84450D_219A1C24_56920832_87152065_03110B72_1A52885D_55909F05,
    256'h8D1E9144_80434B7C_7D58637B_69272968_22369585_89062E07_386F4148_67343A30,
    256'h4A013D2C_133F6D40_75570026_61811D16_98256C59_5E6B6618_2F3C3E10_8399820E
  };

  ////////////////////////////////////////////
  // kmac
  ////////////////////////////////////////////
  // Compile-time random data for PRNG default seed
  parameter kmac_pkg::lfsr_seed_t RndCnstKmacLfsrSeed = {
    32'h47A05221,
    256'hA8D0F96E_FBEEF3F9_FF6B5876_7302C229_957B7D15_9740CA72_CE50C559_20BA14E1
  };

  // Compile-time random permutation for PRNG output
  parameter kmac_pkg::lfsr_perm_t RndCnstKmacLfsrPerm = {
    64'h6F58FC10_F50D6A41,
    256'h06B3C147_B4593F18_42AAC711_B81B14F2_DE79446A_0C7AA76B_E4685DBF_C689C582,
    256'h7BF0B389_7E6B1741_0CF19E90_A1D615AD_12E0EDC1_9AC3F94C_F62ADDA3_49F118F1,
    256'h2016F476_09331513_B0A0B835_53625AA4_A9995F4E_8B9ADF51_64914E62_91D2BA28,
    256'h49594281_32A0972C_9B0CE67F_14255A21_95AD4785_F5BED59A_722CC29A_F8462A9C,
    256'h17076EF0_3BDE8695_96465150_CA5E284A_33067B72_A9539C37_681EC948_87819F78,
    256'h5A4CC598_4598F7C4_2C142201_23232620_3015CCD1_6A7660CB_50193B7D_1F33B961,
    256'h06A45BB5_C808F029_F3081970_91C2FDBA_40E25CD7_4C9FE2E0_9EA3D219_BE633C20,
    256'hCB5B013B_0FE93E8B_19EBD66E_877FC991_E5959762_79626640_01D6F095_16E9B67A,
    256'h9732685A_B091C76B_F40ACA9A_975291A6_7801992E_5928AC5A_49140122_24EAA684,
    256'hA6105D9F_1CB0F6D5_1E440DD5_ED0F5DD4_083EA348_D5B2E56D_7386A0D0_944CC455,
    256'h9D3E551C_DC19413C_9A7258D8_1D315643_1AB64A72_714E3EC2_C140252A_9185482B,
    256'h23EB0816_4E86A74A_9CC79E64_007DDD96_CFA1B5E6_64E3A437_1F4E1D21_CDD422D8,
    256'hB9348173_2B865E73_1C614BC9_7658B071_3AE258C1_6535D726_23362AD0_17CD90B6,
    256'hCD12820C_72D13F1B_73CE99BE_27E19013_154B3481_5F55D8D8_A5852A0E_B0A69A12,
    256'hCD32CA60_8D25F9E2_B6220BB7_7892C51C_7529296F_E288F2F1_444832B2_00C66EBA,
    256'hD555650F_F52C6EB6_905BD651_7C8D0411_1B956264_725AAAEA_E0CCF95B_9CF9B4E4,
    256'h47DC281E_354B0B1B_F1863713_16763E4D_9C32128D_3442F1F5_7FBDA083_AAD76E0C,
    256'h80456472_D0627E98_6323FB1A_91A7EEA1_98516845_84BDEAC6_E372FB1E_84CBCA42,
    256'hD813EB78_61EB4F70_C369F8B9_20A5CF0E_C0E4480D_FA4D43D0_78C6C341_45E8762B,
    256'hCBDB4854_BB925296_48B010E8_761B2813_02D95033_DA41888E_BA22E166_80235E31,
    256'hB1718C61_C61C0C4A_2E787D22_0F12626A_E5568D45_72FE74CA_96C144AA_A46B85F0,
    256'h275EE04A_93A94AEB_2CE50562_DAF1B940_5C4BDC44_7F440C4C_80B32884_49095A94,
    256'h73E0B709_C7E1FDA8_1595D909_6CBBE960_91A36ED2_44E6B2A0_5D6A108A_06CBF01D,
    256'hAEB74890_8AA28F5E_9770314D_E8C0F8CE_A50AD41C_E1AE9B30_0EA84758_0B1DD98A,
    256'hC01788A6_90C86034_1895C217_9F18AB6D_B51A695C_87885D17_1F143216_F93F5A23,
    256'h305C64A0_2646E3AE_408841BA_A0AAFA19_036619A2_0A775F16_B8C2386A_DBE355D5,
    256'h0E44737F_17581346_D250928F_4BB1512C_1ED87869_3B50BC00_DB1DDD05_22D3309B,
    256'h6906752D_00B7266E_99C3677E_BB792540_70023000_05780A53_D2D716CE_810605E2,
    256'h2030C6B8_3A72098C_B9F66813_5AD0BA36_BEA25865_81BCCDE8_EC096397_9672A999,
    256'h67FB21A9_2EA9E826_2F8E6237_EC10B543_A5BDD124_0C4A2558_7005E3A6_CF32AC45,
    256'hA46F35A6_C1205299_0425A0E0_A85B2891_4C430E37_D949A383_849DF971_80FB709B
  };

  // Compile-time random data for PRNG buffer default seed
  parameter kmac_pkg::buffer_lfsr_seed_t RndCnstKmacBufferLfsrSeed = {
    32'hADCDFC5C,
    256'h5F76D4A8_E259D88D_FE9B670A_A0DD992B_FE5D2E12_489D2250_4AA7AC1C_67F59CBA,
    256'h5482C1E3_5E6E3335_C20CC778_FC309917_B9C870AB_E0895D76_F862EF81_F419E3C6,
    256'hCDC8662C_71EAC141_666E443C_6492D9BC_F7A82420_750E5DFC_5E3ED4F2_907532E1
  };

  // Compile-time random permutation for LFSR Message output
  parameter kmac_pkg::msg_perm_t RndCnstKmacMsgPerm = {
    128'h6413B04D_41226A3A_C89962EF_089605B8,
    256'hA93CCDD5_6CD8631C_FDBDEAA3_13434654_27E6102D_F97CBDE0_73E04A9D_357FBE9E
  };

  ////////////////////////////////////////////
  // otbn
  ////////////////////////////////////////////
  // Default seed of the PRNG used for URND.
  parameter otbn_pkg::urnd_prng_seed_t RndCnstOtbnUrndPrngSeed = {
    32'hDD57022C,
    256'h77EDE860_9C409D90_5B3C7819_B26A6743_28819928_C5D79BF1_DB63D11E_1C31BBC9
  };

  // Compile-time random permutation for URND permutation in BN MAC.
  parameter otbn_pkg::bn_mac_urnd_perm_t RndCnstOtbnBnMacUrndPerm = {
    256'hEB13709F_16DF8721_23F81090_2AD0740A_3972B4D8_76A0F957_BDC21CB2_7B310C09,
    256'h60A9BB79_8EAE36FD_2DC1AC32_E9419245_0B825B4E_1DA36675_24BE9AEC_2FDD9358,
    256'hED7F2B8F_33043EE4_F5A71135_EFC8A54B_AA1E01C6_8C17C5F3_CE3763F6_53F7CD46,
    256'hB8981815_6D02FF6C_D1F2FC42_2CD20FD9_DB00738D_26C306AF_D76496C9_F04DFA61,
    256'hEE699B28_52A41F8A_486FE8F1_4FA1255D_3ACFAB2E_945EDAA6_1B6259AD_67296A0E,
    256'h55D64486_9EB72243_0DDCB5B0_D5898197_FE3B7E7D_38565C6E_30917AE2_4A78D4E6,
    256'h509CB683_BF4784CB_035F951A_FBB1E571_E7998008_51A2658B_E1BC054C_D3E385BA,
    256'hE0279D88_F40749EA_4020B33C_3419545A_777CDE12_68B9C06B_CA143DCC_C43FC7A8
  };

  // Compile-time random reset value for IMem/DMem scrambling key.
  parameter otp_ctrl_pkg::otbn_key_t RndCnstOtbnOtbnKey = {
    128'hBEF1F0B9_24C470AC_5A998099_85DC415B
  };

  // Compile-time random reset value for IMem/DMem scrambling nonce.
  parameter otp_ctrl_pkg::otbn_nonce_t RndCnstOtbnOtbnNonce = {
    64'hA1EACED3_82D54C9E
  };

  ////////////////////////////////////////////
  // keymgr_dpe
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter keymgr_pkg::lfsr_seed_t RndCnstKeymgrDpeLfsrSeed = {
    64'h378D030E_A5D37665
  };

  // Compile-time random permutation for LFSR output
  parameter keymgr_pkg::lfsr_perm_t RndCnstKeymgrDpeLfsrPerm = {
    128'h6F2F2513_8426806B_A968F86A_C76091BD,
    256'hE2EB50C3_59174ED2_1D673F23_A9F705DC_E4C2C0E2_7D5B498F_E2BD639A_135C03B5
  };

  // Compile-time random permutation for entropy used in share overriding
  parameter keymgr_pkg::rand_perm_t RndCnstKeymgrDpeRandPerm = {
    160'h5CE46D90_7D6FA366_5558800F_AFDE8812_4B9E3C2E
  };

  // Compile-time random bits for revision seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeRevisionSeed = {
    256'h6D07801B_027BD4E9_BF578B14_6F616B60_82465E44_680CE936_49A84575_B465479F
  };

  // Compile-time random bits for software generation seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeSoftOutputSeed = {
    256'h31A97523_4377E00D_28EC32FA_5850E8A7_F607A49B_2CADE12A_F0DD48B9_227A9781
  };

  // Compile-time random bits for hardware generation seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeHardOutputSeed = {
    256'h79AA2E6A_DC5EA5FD_83777D38_7766BA9E_8C77A65B_1AAD174D_D41ACA70_D3807BA5
  };

  // Compile-time random bits for generation seed when aes destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeAesSeed = {
    256'h4E793023_FA711994_CCF5D2F4_2DAFFA84_621AB157_014B7050_9DA8413D_DA43FECD
  };

  // Compile-time random bits for generation seed when kmac destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeKmacSeed = {
    256'hD6C1A586_93232D1C_3E361D85_6AB2D1DC_6455D87F_13C9A467_1446BEA8_56D5FBB5
  };

  // Compile-time random bits for generation seed when otbn destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeOtbnSeed = {
    256'h4BB5B253_A70BC372_CFC9BB0A_B38A5EDA_BEE7D224_D1A66837_8437DD24_797B602B
  };

  // Compile-time random bits for generation seed when no destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrDpeNoneSeed = {
    256'h068C0A1A_ECA298C9_6A8130AB_336462CE_E1BF8C65_3FDE5A40_A24DF78E_146916DC
  };

  ////////////////////////////////////////////
  // csrng
  ////////////////////////////////////////////
  // Compile-time random bits for csrng state group diversification value
  parameter csrng_pkg::cs_keymgr_div_t RndCnstCsrngCsKeymgrDivNonProduction = {
    128'h55F8CE6D_BFAAD089_10FBE182_2C22A17A,
    256'h376FA131_5C0CB3C2_9CF4D10A_E5C8F0C7_B034BF23_C9068E30_7D8513B7_734AA78C
  };

  // Compile-time random bits for csrng state group diversification value
  parameter csrng_pkg::cs_keymgr_div_t RndCnstCsrngCsKeymgrDivProduction = {
    128'hC36F947A_2737BBC0_ACD1447B_AA83C3FC,
    256'h818BB3B4_A840AD32_14CEB3F3_54CA2E08_9302C3EE_1D695AA6_16283205_DB05CD6C
  };

  ////////////////////////////////////////////
  // sram_ctrl_main
  ////////////////////////////////////////////
  // Compile-time random reset value for SRAM scrambling key.
  parameter otp_ctrl_pkg::sram_key_t RndCnstSramCtrlMainSramKey = {
    128'h18888AD0_1FE046EA_FD8BF298_DB7D5FE0
  };

  // Compile-time random reset value for SRAM scrambling nonce.
  parameter otp_ctrl_pkg::sram_nonce_t RndCnstSramCtrlMainSramNonce = {
    128'hFD32A296_89A0C154_9C28C210_C01FF7E6
  };

  // Compile-time random bits for initial LFSR seed
  parameter sram_ctrl_pkg::lfsr_seed_t RndCnstSramCtrlMainLfsrSeed = {
    64'hE6D20E04_04E7B51D
  };

  // Compile-time random permutation for LFSR output
  parameter sram_ctrl_pkg::lfsr_perm_t RndCnstSramCtrlMainLfsrPerm = {
    128'hEB06799C_398804D3_06422AD8_93CB7555,
    256'hFDFF58BD_8AAAC1DC_EE14B43B_18DB46EC_DEF54F84_BCF82974_54F8CA52_576A8080
  };

  ////////////////////////////////////////////
  // rom_ctrl
  ////////////////////////////////////////////
  // Fixed nonce used for address / data scrambling
  parameter bit [63:0] RndCnstRomCtrlScrNonce = {
    64'h64E61308_8D6DF2CC
  };

  // Randomised constant used as a scrambling key for ROM data
  parameter bit [127:0] RndCnstRomCtrlScrKey = {
    128'h4352AA62_DF6B0719_9EA6C678_2AD9BB2E
  };

  ////////////////////////////////////////////
  // rv_core_ibex
  ////////////////////////////////////////////
  // Default seed of the PRNG used for random instructions.
  parameter ibex_pkg::lfsr_seed_t RndCnstRvCoreIbexLfsrSeed = {
    32'h78FA04C6
  };

  // Permutation applied to the LFSR of the PRNG used for random instructions.
  parameter ibex_pkg::lfsr_perm_t RndCnstRvCoreIbexLfsrPerm = {
    160'h9A503E2E_1D216ECF_99C17E3C_DCEA8015_AAA3EE51
  };

  // Default icache scrambling key
  parameter logic [ibex_pkg::SCRAMBLE_KEY_W-1:0] RndCnstRvCoreIbexIbexKeyDefault = {
    128'hA119650A_85C30237_536DC3E3_5040DE9A
  };

  // Default icache scrambling nonce
  parameter logic [ibex_pkg::SCRAMBLE_NONCE_W-1:0] RndCnstRvCoreIbexIbexNonceDefault = {
    64'hC1A6F2B3_5C99FB71
  };

endpackage : top_earlgrey_rnd_cnst_pkg
