`timescale 1ps/1ps
`default_nettype none

(* DowngradeIPIdentifiedWarnings="yes" *)
module cmac_usplus_core_support #(
  parameter N_COMMON = 2
) (
  input wire logic [3 :0]     gt_rxp_in,
  input wire logic [3 :0]     gt_rxn_in,
  output logic [3 :0]         gt_txp_out,
  output logic [3 :0]         gt_txn_out,
  output logic                gt_txusrclk2,
  input wire logic [11 : 0]   gt_loopback_in,
  output logic [3 :0]         gt_rxrecclkout,
  output logic [3 :0]         gt_powergoodout,
  output logic                gt_ref_clk_out,
  input wire logic            gtwiz_reset_tx_datapath,
  input wire logic            gtwiz_reset_rx_datapath,

  input wire logic       sys_reset,
  input wire logic       gt_ref_clk_p,
  input wire logic       gt_ref_clk_n,
  input wire logic       init_clk,

  output logic           rx_axis_tvalid,
  output logic [511:0]   rx_axis_tdata,
  output logic           rx_axis_tlast,
  output logic [63:0]    rx_axis_tkeep,
  output logic           rx_axis_tuser,
  output logic [7:0]     rx_otn_bip8_0,
  output logic [7:0]     rx_otn_bip8_1,
  output logic [7:0]     rx_otn_bip8_2,
  output logic [7:0]     rx_otn_bip8_3,
  output logic [7:0]     rx_otn_bip8_4,
  output logic [65:0]    rx_otn_data_0,
  output logic [65:0]    rx_otn_data_1,
  output logic [65:0]    rx_otn_data_2,
  output logic [65:0]    rx_otn_data_3,
  output logic [65:0]    rx_otn_data_4,
  output logic           rx_otn_ena,
  output logic           rx_otn_lane0,
  output logic           rx_otn_vlmarker,
  output logic [55:0]    rx_preambleout,
  output logic           usr_rx_reset,
  output logic           gt_rxusrclk2,
  output logic           stat_rx_aligned,
  output logic           stat_rx_aligned_err,
  output logic [2 : 0]   stat_rx_bad_code,
  output logic [2 : 0]   stat_rx_bad_fcs,
  output logic           stat_rx_bad_preamble,
  output logic           stat_rx_bad_sfd,
  output logic           stat_rx_bip_err_0,
  output logic           stat_rx_bip_err_1,
  output logic           stat_rx_bip_err_10,
  output logic           stat_rx_bip_err_11,
  output logic           stat_rx_bip_err_12,
  output logic           stat_rx_bip_err_13,
  output logic           stat_rx_bip_err_14,
  output logic           stat_rx_bip_err_15,
  output logic           stat_rx_bip_err_16,
  output logic           stat_rx_bip_err_17,
  output logic           stat_rx_bip_err_18,
  output logic           stat_rx_bip_err_19,
  output logic           stat_rx_bip_err_2,
  output logic           stat_rx_bip_err_3,
  output logic           stat_rx_bip_err_4,
  output logic           stat_rx_bip_err_5,
  output logic           stat_rx_bip_err_6,
  output logic           stat_rx_bip_err_7,
  output logic           stat_rx_bip_err_8,
  output logic           stat_rx_bip_err_9,
  output logic [19 : 0]  stat_rx_block_lock,
  output logic           stat_rx_broadcast,
  output logic [2 : 0]   stat_rx_fragment,
  output logic [1 : 0]   stat_rx_framing_err_0,
  output logic [1 : 0]   stat_rx_framing_err_1,
  output logic [1 : 0]   stat_rx_framing_err_10,
  output logic [1 : 0]   stat_rx_framing_err_11,
  output logic [1 : 0]   stat_rx_framing_err_12,
  output logic [1 : 0]   stat_rx_framing_err_13,
  output logic [1 : 0]   stat_rx_framing_err_14,
  output logic [1 : 0]   stat_rx_framing_err_15,
  output logic [1 : 0]   stat_rx_framing_err_16,
  output logic [1 : 0]   stat_rx_framing_err_17,
  output logic [1 : 0]   stat_rx_framing_err_18,
  output logic [1 : 0]   stat_rx_framing_err_19,
  output logic [1 : 0]   stat_rx_framing_err_2,
  output logic [1 : 0]   stat_rx_framing_err_3,
  output logic [1 : 0]   stat_rx_framing_err_4,
  output logic [1 : 0]   stat_rx_framing_err_5,
  output logic [1 : 0]   stat_rx_framing_err_6,
  output logic [1 : 0]   stat_rx_framing_err_7,
  output logic [1 : 0]   stat_rx_framing_err_8,
  output logic [1 : 0]   stat_rx_framing_err_9,
  output logic           stat_rx_framing_err_valid_0,
  output logic           stat_rx_framing_err_valid_1,
  output logic           stat_rx_framing_err_valid_10,
  output logic           stat_rx_framing_err_valid_11,
  output logic           stat_rx_framing_err_valid_12,
  output logic           stat_rx_framing_err_valid_13,
  output logic           stat_rx_framing_err_valid_14,
  output logic           stat_rx_framing_err_valid_15,
  output logic           stat_rx_framing_err_valid_16,
  output logic           stat_rx_framing_err_valid_17,
  output logic           stat_rx_framing_err_valid_18,
  output logic           stat_rx_framing_err_valid_19,
  output logic           stat_rx_framing_err_valid_2,
  output logic           stat_rx_framing_err_valid_3,
  output logic           stat_rx_framing_err_valid_4,
  output logic           stat_rx_framing_err_valid_5,
  output logic           stat_rx_framing_err_valid_6,
  output logic           stat_rx_framing_err_valid_7,
  output logic           stat_rx_framing_err_valid_8,
  output logic           stat_rx_framing_err_valid_9,
  output logic           stat_rx_got_signal_os,
  output logic           stat_rx_hi_ber,
  output logic           stat_rx_inrangeerr,
  output logic           stat_rx_internal_local_fault,
  output logic           stat_rx_jabber,
  output logic           stat_rx_local_fault,
  output logic [19 : 0]  stat_rx_mf_err,
  output logic [19 : 0]  stat_rx_mf_len_err,
  output logic [19 : 0]  stat_rx_mf_repeat_err,
  output logic           stat_rx_misaligned,
  output logic           stat_rx_multicast,
  output logic           stat_rx_oversize,
  output logic           stat_rx_packet_1024_1518_bytes,
  output logic           stat_rx_packet_128_255_bytes,
  output logic           stat_rx_packet_1519_1522_bytes,
  output logic           stat_rx_packet_1523_1548_bytes,
  output logic           stat_rx_packet_1549_2047_bytes,
  output logic           stat_rx_packet_2048_4095_bytes,
  output logic           stat_rx_packet_256_511_bytes,
  output logic           stat_rx_packet_4096_8191_bytes,
  output logic           stat_rx_packet_512_1023_bytes,
  output logic           stat_rx_packet_64_bytes,
  output logic           stat_rx_packet_65_127_bytes,
  output logic           stat_rx_packet_8192_9215_bytes,
  output logic           stat_rx_packet_bad_fcs,
  output logic           stat_rx_packet_large,
  output logic [2 : 0]   stat_rx_packet_small,
  input wire logic       ctl_rx_enable,
  input wire logic       ctl_rx_force_resync,
  input wire logic       ctl_rx_test_pattern,
  input wire logic       core_rx_reset,
  input wire logic       rx_clk,
  output logic           stat_rx_received_local_fault,
  output logic           stat_rx_remote_fault,
  output logic           stat_rx_status,
  output logic [2 : 0]   stat_rx_stomped_fcs,
  output logic [19 : 0]  stat_rx_synced,
  output logic [19 : 0]  stat_rx_synced_err,
  output logic [2 : 0]   stat_rx_test_pattern_mismatch,
  output logic           stat_rx_toolong,
  output logic [6 : 0]   stat_rx_total_bytes,
  output logic [13 : 0]  stat_rx_total_good_bytes,
  output logic           stat_rx_total_good_packets,
  output logic [2 : 0]   stat_rx_total_packets,
  output logic           stat_rx_truncated,
  output logic [2 : 0]   stat_rx_undersize,
  output logic           stat_rx_unicast,
  output logic           stat_rx_vlan,
  output logic [19 : 0]  stat_rx_pcsl_demuxed,
  output logic [4 : 0]   stat_rx_pcsl_number_0,
  output logic [4 : 0]   stat_rx_pcsl_number_1,
  output logic [4 : 0]   stat_rx_pcsl_number_10,
  output logic [4 : 0]   stat_rx_pcsl_number_11,
  output logic [4 : 0]   stat_rx_pcsl_number_12,
  output logic [4 : 0]   stat_rx_pcsl_number_13,
  output logic [4 : 0]   stat_rx_pcsl_number_14,
  output logic [4 : 0]   stat_rx_pcsl_number_15,
  output logic [4 : 0]   stat_rx_pcsl_number_16,
  output logic [4 : 0]   stat_rx_pcsl_number_17,
  output logic [4 : 0]   stat_rx_pcsl_number_18,
  output logic [4 : 0]   stat_rx_pcsl_number_19,
  output logic [4 : 0]   stat_rx_pcsl_number_2,
  output logic [4 : 0]   stat_rx_pcsl_number_3,
  output logic [4 : 0]   stat_rx_pcsl_number_4,
  output logic [4 : 0]   stat_rx_pcsl_number_5,
  output logic [4 : 0]   stat_rx_pcsl_number_6,
  output logic [4 : 0]   stat_rx_pcsl_number_7,
  output logic [4 : 0]   stat_rx_pcsl_number_8,
  output logic [4 : 0]   stat_rx_pcsl_number_9,
  output logic           stat_tx_bad_fcs,
  output logic           stat_tx_broadcast,
  output logic           stat_tx_frame_error,
  output logic           stat_tx_local_fault,
  output logic           stat_tx_multicast,
  output logic           stat_tx_packet_1024_1518_bytes,
  output logic           stat_tx_packet_128_255_bytes,
  output logic           stat_tx_packet_1519_1522_bytes,
  output logic           stat_tx_packet_1523_1548_bytes,
  output logic           stat_tx_packet_1549_2047_bytes,
  output logic           stat_tx_packet_2048_4095_bytes,
  output logic           stat_tx_packet_256_511_bytes,
  output logic           stat_tx_packet_4096_8191_bytes,
  output logic           stat_tx_packet_512_1023_bytes,
  output logic           stat_tx_packet_64_bytes,
  output logic           stat_tx_packet_65_127_bytes,
  output logic           stat_tx_packet_8192_9215_bytes,
  output logic           stat_tx_packet_large,
  output logic           stat_tx_packet_small,
  output logic [5 : 0]   stat_tx_total_bytes,
  output logic [13 : 0]  stat_tx_total_good_bytes,
  output logic           stat_tx_total_good_packets,
  output logic           stat_tx_total_packets,
  output logic           stat_tx_unicast,
  output logic           stat_tx_vlan,


  input wire logic          ctl_tx_enable,
  input wire logic          ctl_tx_test_pattern,
  input wire logic          ctl_tx_send_idle,
  input wire logic          ctl_tx_send_rfi,
  input wire logic          ctl_tx_send_lfi,
  input wire logic          core_tx_reset,
  output logic              tx_axis_tready,
  input wire logic          tx_axis_tvalid,
  input wire logic [511:0]  tx_axis_tdata,
  input wire logic          tx_axis_tlast,
  input wire logic [63:0]   tx_axis_tkeep,
  input wire logic          tx_axis_tuser,
  output logic              tx_ovfout,
  output logic              tx_unfout,
  input wire logic [55 : 0] tx_preamblein,
  output logic              usr_tx_reset,
  input wire logic          core_drp_reset,
  input wire logic          drp_clk,
  input wire logic [9 : 0]  drp_addr,
  input wire logic [15 : 0] drp_di,
  input wire logic          drp_en,
  output logic [15 : 0]     drp_do,
  output logic              drp_rdy,
  input wire logic          drp_we,

  //rsfec ports
  input wire logic       ctl_tx_rsfec_enable,
  input wire logic       ctl_rx_rsfec_enable,
  input wire logic       ctl_rsfec_ieee_error_indication_mode,
  input wire logic       ctl_rx_rsfec_enable_correction,
  input wire logic       ctl_rx_rsfec_enable_indication,
  output logic           stat_rx_rsfec_am_lock0,
  output logic           stat_rx_rsfec_am_lock1,
  output logic           stat_rx_rsfec_am_lock2,
  output logic           stat_rx_rsfec_am_lock3,
  output logic           stat_rx_rsfec_corrected_cw_inc,
  output logic           stat_rx_rsfec_cw_inc,
  output logic [2 : 0]   stat_rx_rsfec_err_count0_inc,
  output logic [2 : 0]   stat_rx_rsfec_err_count1_inc,
  output logic [2 : 0]   stat_rx_rsfec_err_count2_inc,
  output logic [2 : 0]   stat_rx_rsfec_err_count3_inc,
  output logic           stat_rx_rsfec_hi_ser,
  output logic           stat_rx_rsfec_lane_alignment_status,
  output logic [13 : 0]  stat_rx_rsfec_lane_fill_0,
  output logic [13 : 0]  stat_rx_rsfec_lane_fill_1,
  output logic [13 : 0]  stat_rx_rsfec_lane_fill_2,
  output logic [13 : 0]  stat_rx_rsfec_lane_fill_3,
  output logic [7 : 0]   stat_rx_rsfec_lane_mapping,
  output logic           stat_rx_rsfec_uncorrected_cw_inc
);

  logic          tx_reset_done;
  logic          rx_reset_done;
  logic  [9:0]   rx_serdes_reset_done;
  logic          gtpowergood_int;
  logic          gt_reset_tx_done;
  logic          gt_reset_rx_done;
  logic  [9:0]   rx_serdes_clk;
  logic  [0 :0]  gtwiz_reset_qpll0reset_out;
  logic  [0 :0]  gtwiz_reset_qpll0lock_in;

  logic [3:0] qpll0clk_in;
  logic [3:0] qpll0refclk_in;

  logic [N_COMMON-1:0] qpll0outclk_out; 
  logic [N_COMMON-1:0] qpll0outrefclk_out; 
  logic [N_COMMON-1:0] qpll0reset;

  logic [N_COMMON-1:0] qpll0lock_out;

  generate
    always_comb begin
      if (N_COMMON == 2) begin 
        // TODO: comment on me, bitwise-and lock out
        gtwiz_reset_qpll0lock_in = &qpll0lock_out;

        // replicate and forward qpll0 clock to gty channels in corresponding banks
        qpll0clk_in    = {{2{qpll0outclk_out[1]}},{2{qpll0outclk_out[0]}}};
        qpll0refclk_in = {{2{qpll0outrefclk_out[1]}},{2{qpll0outrefclk_out[0]}}};

        // forward reset to COMMON qplls, replicate when routing to multiple COMMONs
        qpll0reset = {2{gtwiz_reset_qpll0reset_out}};

      end else begin
        gtwiz_reset_qpll0lock_in = qpll0lock_out;

        // replicate and forward qpll0 clock to gty channels in corresponding banks
        qpll0clk_in    = {4{qpll0outclk_out[0]}};
        qpll0refclk_in = {4{qpll0outrefclk_out[0]}};

        // forward reset to COMMON qplls
        qpll0reset = gtwiz_reset_qpll0reset_out;

      end
    end
  endgenerate

  assign gtpowergood_int = (&gt_powergoodout);

EthMACPHY100GQSFP4x_rsfec cmac_inst (
  .gt_rxp_in                            (gt_rxp_in),
  .gt_rxn_in                            (gt_rxn_in),
  .gt_txp_out                           (gt_txp_out),
  .gt_txn_out                           (gt_txn_out),
  .gt_txusrclk2                         (gt_txusrclk2),
  .gt_loopback_in                       (gt_loopback_in),
  .gt_rxrecclkout                       (gt_rxrecclkout),
  .gt_powergoodout                      (gt_powergoodout),
  .gtwiz_reset_tx_datapath              (gtwiz_reset_tx_datapath),
  .gtwiz_reset_rx_datapath              (gtwiz_reset_rx_datapath),
  .sys_reset                            (sys_reset),
  .init_clk                             (init_clk),
  .rx_axis_tvalid                       (rx_axis_tvalid),
  .rx_axis_tdata                        (rx_axis_tdata),
  .rx_axis_tkeep                        (rx_axis_tkeep),
  .rx_axis_tlast                        (rx_axis_tlast),
  .rx_axis_tuser                        (rx_axis_tuser),
  .rx_otn_bip8_0                        (rx_otn_bip8_0),
  .rx_otn_bip8_1                        (rx_otn_bip8_1),
  .rx_otn_bip8_2                        (rx_otn_bip8_2),
  .rx_otn_bip8_3                        (rx_otn_bip8_3),
  .rx_otn_bip8_4                        (rx_otn_bip8_4),
  .rx_otn_data_0                        (rx_otn_data_0),
  .rx_otn_data_1                        (rx_otn_data_1),
  .rx_otn_data_2                        (rx_otn_data_2),
  .rx_otn_data_3                        (rx_otn_data_3),
  .rx_otn_data_4                        (rx_otn_data_4),
  .rx_otn_ena                           (rx_otn_ena),
  .rx_otn_lane0                         (rx_otn_lane0),
  .rx_otn_vlmarker                      (rx_otn_vlmarker),
  .rx_preambleout                       (rx_preambleout),
  .gt_rxusrclk2                         (gt_rxusrclk2),
  .stat_rx_aligned                      (stat_rx_aligned),
  .stat_rx_aligned_err                  (stat_rx_aligned_err),
  .stat_rx_bad_code                     (stat_rx_bad_code),
  .stat_rx_bad_fcs                      (stat_rx_bad_fcs),
  .stat_rx_bad_preamble                 (stat_rx_bad_preamble),
  .stat_rx_bad_sfd                      (stat_rx_bad_sfd),
  .stat_rx_bip_err_0                    (stat_rx_bip_err_0),
  .stat_rx_bip_err_1                    (stat_rx_bip_err_1),
  .stat_rx_bip_err_10                   (stat_rx_bip_err_10),
  .stat_rx_bip_err_11                   (stat_rx_bip_err_11),
  .stat_rx_bip_err_12                   (stat_rx_bip_err_12),
  .stat_rx_bip_err_13                   (stat_rx_bip_err_13),
  .stat_rx_bip_err_14                   (stat_rx_bip_err_14),
  .stat_rx_bip_err_15                   (stat_rx_bip_err_15),
  .stat_rx_bip_err_16                   (stat_rx_bip_err_16),
  .stat_rx_bip_err_17                   (stat_rx_bip_err_17),
  .stat_rx_bip_err_18                   (stat_rx_bip_err_18),
  .stat_rx_bip_err_19                   (stat_rx_bip_err_19),
  .stat_rx_bip_err_2                    (stat_rx_bip_err_2),
  .stat_rx_bip_err_3                    (stat_rx_bip_err_3),
  .stat_rx_bip_err_4                    (stat_rx_bip_err_4),
  .stat_rx_bip_err_5                    (stat_rx_bip_err_5),
  .stat_rx_bip_err_6                    (stat_rx_bip_err_6),
  .stat_rx_bip_err_7                    (stat_rx_bip_err_7),
  .stat_rx_bip_err_8                    (stat_rx_bip_err_8),
  .stat_rx_bip_err_9                    (stat_rx_bip_err_9),
  .stat_rx_block_lock                   (stat_rx_block_lock),
  .stat_rx_broadcast                    (stat_rx_broadcast),
  .stat_rx_fragment                     (stat_rx_fragment),
  .stat_rx_framing_err_0                (stat_rx_framing_err_0),
  .stat_rx_framing_err_1                (stat_rx_framing_err_1),
  .stat_rx_framing_err_10               (stat_rx_framing_err_10),
  .stat_rx_framing_err_11               (stat_rx_framing_err_11),
  .stat_rx_framing_err_12               (stat_rx_framing_err_12),
  .stat_rx_framing_err_13               (stat_rx_framing_err_13),
  .stat_rx_framing_err_14               (stat_rx_framing_err_14),
  .stat_rx_framing_err_15               (stat_rx_framing_err_15),
  .stat_rx_framing_err_16               (stat_rx_framing_err_16),
  .stat_rx_framing_err_17               (stat_rx_framing_err_17),
  .stat_rx_framing_err_18               (stat_rx_framing_err_18),
  .stat_rx_framing_err_19               (stat_rx_framing_err_19),
  .stat_rx_framing_err_2                (stat_rx_framing_err_2),
  .stat_rx_framing_err_3                (stat_rx_framing_err_3),
  .stat_rx_framing_err_4                (stat_rx_framing_err_4),
  .stat_rx_framing_err_5                (stat_rx_framing_err_5),
  .stat_rx_framing_err_6                (stat_rx_framing_err_6),
  .stat_rx_framing_err_7                (stat_rx_framing_err_7),
  .stat_rx_framing_err_8                (stat_rx_framing_err_8),
  .stat_rx_framing_err_9                (stat_rx_framing_err_9),
  .stat_rx_framing_err_valid_0          (stat_rx_framing_err_valid_0),
  .stat_rx_framing_err_valid_1          (stat_rx_framing_err_valid_1),
  .stat_rx_framing_err_valid_10         (stat_rx_framing_err_valid_10),
  .stat_rx_framing_err_valid_11         (stat_rx_framing_err_valid_11),
  .stat_rx_framing_err_valid_12         (stat_rx_framing_err_valid_12),
  .stat_rx_framing_err_valid_13         (stat_rx_framing_err_valid_13),
  .stat_rx_framing_err_valid_14         (stat_rx_framing_err_valid_14),
  .stat_rx_framing_err_valid_15         (stat_rx_framing_err_valid_15),
  .stat_rx_framing_err_valid_16         (stat_rx_framing_err_valid_16),
  .stat_rx_framing_err_valid_17         (stat_rx_framing_err_valid_17),
  .stat_rx_framing_err_valid_18         (stat_rx_framing_err_valid_18),
  .stat_rx_framing_err_valid_19         (stat_rx_framing_err_valid_19),
  .stat_rx_framing_err_valid_2          (stat_rx_framing_err_valid_2),
  .stat_rx_framing_err_valid_3          (stat_rx_framing_err_valid_3),
  .stat_rx_framing_err_valid_4          (stat_rx_framing_err_valid_4),
  .stat_rx_framing_err_valid_5          (stat_rx_framing_err_valid_5),
  .stat_rx_framing_err_valid_6          (stat_rx_framing_err_valid_6),
  .stat_rx_framing_err_valid_7          (stat_rx_framing_err_valid_7),
  .stat_rx_framing_err_valid_8          (stat_rx_framing_err_valid_8),
  .stat_rx_framing_err_valid_9          (stat_rx_framing_err_valid_9),
  .stat_rx_got_signal_os                (stat_rx_got_signal_os),
  .stat_rx_hi_ber                       (stat_rx_hi_ber),
  .stat_rx_inrangeerr                   (stat_rx_inrangeerr),
  .stat_rx_internal_local_fault         (stat_rx_internal_local_fault),
  .stat_rx_jabber                       (stat_rx_jabber),
  .stat_rx_local_fault                  (stat_rx_local_fault),
  .stat_rx_mf_err                       (stat_rx_mf_err),
  .stat_rx_mf_len_err                   (stat_rx_mf_len_err),
  .stat_rx_mf_repeat_err                (stat_rx_mf_repeat_err),
  .stat_rx_misaligned                   (stat_rx_misaligned),
  .stat_rx_multicast                    (stat_rx_multicast),
  .stat_rx_oversize                     (stat_rx_oversize),
  .stat_rx_packet_1024_1518_bytes       (stat_rx_packet_1024_1518_bytes),
  .stat_rx_packet_128_255_bytes         (stat_rx_packet_128_255_bytes),
  .stat_rx_packet_1519_1522_bytes       (stat_rx_packet_1519_1522_bytes),
  .stat_rx_packet_1523_1548_bytes       (stat_rx_packet_1523_1548_bytes),
  .stat_rx_packet_1549_2047_bytes       (stat_rx_packet_1549_2047_bytes),
  .stat_rx_packet_2048_4095_bytes       (stat_rx_packet_2048_4095_bytes),
  .stat_rx_packet_256_511_bytes         (stat_rx_packet_256_511_bytes),
  .stat_rx_packet_4096_8191_bytes       (stat_rx_packet_4096_8191_bytes),
  .stat_rx_packet_512_1023_bytes        (stat_rx_packet_512_1023_bytes),
  .stat_rx_packet_64_bytes              (stat_rx_packet_64_bytes),
  .stat_rx_packet_65_127_bytes          (stat_rx_packet_65_127_bytes),
  .stat_rx_packet_8192_9215_bytes       (stat_rx_packet_8192_9215_bytes),
  .stat_rx_packet_bad_fcs               (stat_rx_packet_bad_fcs),
  .stat_rx_packet_large                 (stat_rx_packet_large),
  .stat_rx_packet_small                 (stat_rx_packet_small),
  .ctl_rx_enable                        (ctl_rx_enable),
  .ctl_rx_force_resync                  (ctl_rx_force_resync),
  .ctl_rx_test_pattern                  (ctl_rx_test_pattern),
  .ctl_rsfec_ieee_error_indication_mode (ctl_rsfec_ieee_error_indication_mode),
  .ctl_rx_rsfec_enable                  (ctl_rx_rsfec_enable),
  .ctl_rx_rsfec_enable_correction       (ctl_rx_rsfec_enable_correction),
  .ctl_rx_rsfec_enable_indication       (ctl_rx_rsfec_enable_indication),
  .rx_clk                               (rx_clk),
  .stat_rx_received_local_fault         (stat_rx_received_local_fault),
  .stat_rx_remote_fault                 (stat_rx_remote_fault),
  .stat_rx_status                       (stat_rx_status),
  .stat_rx_stomped_fcs                  (stat_rx_stomped_fcs),
  .stat_rx_synced                       (stat_rx_synced),
  .stat_rx_synced_err                   (stat_rx_synced_err),
  .stat_rx_test_pattern_mismatch        (stat_rx_test_pattern_mismatch),
  .stat_rx_toolong                      (stat_rx_toolong),
  .stat_rx_total_bytes                  (stat_rx_total_bytes),
  .stat_rx_total_good_bytes             (stat_rx_total_good_bytes),
  .stat_rx_total_good_packets           (stat_rx_total_good_packets),
  .stat_rx_total_packets                (stat_rx_total_packets),
  .stat_rx_truncated                    (stat_rx_truncated),
  .stat_rx_undersize                    (stat_rx_undersize),
  .stat_rx_unicast                      (stat_rx_unicast),
  .stat_rx_vlan                         (stat_rx_vlan),
  .stat_rx_pcsl_demuxed                 (stat_rx_pcsl_demuxed),
  .stat_rx_pcsl_number_0                (stat_rx_pcsl_number_0),
  .stat_rx_pcsl_number_1                (stat_rx_pcsl_number_1),
  .stat_rx_pcsl_number_10               (stat_rx_pcsl_number_10),
  .stat_rx_pcsl_number_11               (stat_rx_pcsl_number_11),
  .stat_rx_pcsl_number_12               (stat_rx_pcsl_number_12),
  .stat_rx_pcsl_number_13               (stat_rx_pcsl_number_13),
  .stat_rx_pcsl_number_14               (stat_rx_pcsl_number_14),
  .stat_rx_pcsl_number_15               (stat_rx_pcsl_number_15),
  .stat_rx_pcsl_number_16               (stat_rx_pcsl_number_16),
  .stat_rx_pcsl_number_17               (stat_rx_pcsl_number_17),
  .stat_rx_pcsl_number_18               (stat_rx_pcsl_number_18),
  .stat_rx_pcsl_number_19               (stat_rx_pcsl_number_19),
  .stat_rx_pcsl_number_2                (stat_rx_pcsl_number_2),
  .stat_rx_pcsl_number_3                (stat_rx_pcsl_number_3),
  .stat_rx_pcsl_number_4                (stat_rx_pcsl_number_4),
  .stat_rx_pcsl_number_5                (stat_rx_pcsl_number_5),
  .stat_rx_pcsl_number_6                (stat_rx_pcsl_number_6),
  .stat_rx_pcsl_number_7                (stat_rx_pcsl_number_7),
  .stat_rx_pcsl_number_8                (stat_rx_pcsl_number_8),
  .stat_rx_pcsl_number_9                (stat_rx_pcsl_number_9),
  .stat_rx_rsfec_am_lock0               (stat_rx_rsfec_am_lock0),
  .stat_rx_rsfec_am_lock1               (stat_rx_rsfec_am_lock1),
  .stat_rx_rsfec_am_lock2               (stat_rx_rsfec_am_lock2),
  .stat_rx_rsfec_am_lock3               (stat_rx_rsfec_am_lock3),
  .stat_rx_rsfec_corrected_cw_inc       (stat_rx_rsfec_corrected_cw_inc),
  .stat_rx_rsfec_cw_inc                 (stat_rx_rsfec_cw_inc),
  .stat_rx_rsfec_err_count0_inc         (stat_rx_rsfec_err_count0_inc),
  .stat_rx_rsfec_err_count1_inc         (stat_rx_rsfec_err_count1_inc),
  .stat_rx_rsfec_err_count2_inc         (stat_rx_rsfec_err_count2_inc),
  .stat_rx_rsfec_err_count3_inc         (stat_rx_rsfec_err_count3_inc),
  .stat_rx_rsfec_hi_ser                 (stat_rx_rsfec_hi_ser),
  .stat_rx_rsfec_lane_alignment_status  (stat_rx_rsfec_lane_alignment_status),
  .stat_rx_rsfec_lane_fill_0            (stat_rx_rsfec_lane_fill_0),
  .stat_rx_rsfec_lane_fill_1            (stat_rx_rsfec_lane_fill_1),
  .stat_rx_rsfec_lane_fill_2            (stat_rx_rsfec_lane_fill_2),
  .stat_rx_rsfec_lane_fill_3            (stat_rx_rsfec_lane_fill_3),
  .stat_rx_rsfec_lane_mapping           (stat_rx_rsfec_lane_mapping),
  .stat_rx_rsfec_uncorrected_cw_inc     (stat_rx_rsfec_uncorrected_cw_inc),
  .stat_tx_bad_fcs                      (stat_tx_bad_fcs),
  .stat_tx_broadcast                    (stat_tx_broadcast),
  .stat_tx_frame_error                  (stat_tx_frame_error),
  .stat_tx_local_fault                  (stat_tx_local_fault),
  .stat_tx_multicast                    (stat_tx_multicast),
  .stat_tx_packet_1024_1518_bytes       (stat_tx_packet_1024_1518_bytes),
  .stat_tx_packet_128_255_bytes         (stat_tx_packet_128_255_bytes),
  .stat_tx_packet_1519_1522_bytes       (stat_tx_packet_1519_1522_bytes),
  .stat_tx_packet_1523_1548_bytes       (stat_tx_packet_1523_1548_bytes),
  .stat_tx_packet_1549_2047_bytes       (stat_tx_packet_1549_2047_bytes),
  .stat_tx_packet_2048_4095_bytes       (stat_tx_packet_2048_4095_bytes),
  .stat_tx_packet_256_511_bytes         (stat_tx_packet_256_511_bytes),
  .stat_tx_packet_4096_8191_bytes       (stat_tx_packet_4096_8191_bytes),
  .stat_tx_packet_512_1023_bytes        (stat_tx_packet_512_1023_bytes),
  .stat_tx_packet_64_bytes              (stat_tx_packet_64_bytes),
  .stat_tx_packet_65_127_bytes          (stat_tx_packet_65_127_bytes),
  .stat_tx_packet_8192_9215_bytes       (stat_tx_packet_8192_9215_bytes),
  .stat_tx_packet_large                 (stat_tx_packet_large),
  .stat_tx_packet_small                 (stat_tx_packet_small),
  .stat_tx_total_bytes                  (stat_tx_total_bytes),
  .stat_tx_total_good_bytes             (stat_tx_total_good_bytes),
  .stat_tx_total_good_packets           (stat_tx_total_good_packets),
  .stat_tx_total_packets                (stat_tx_total_packets),
  .stat_tx_unicast                      (stat_tx_unicast),
  .stat_tx_vlan                         (stat_tx_vlan),

  .ctl_tx_enable                        (ctl_tx_enable),
  .ctl_tx_test_pattern                  (ctl_tx_test_pattern),
  .ctl_tx_rsfec_enable                  (ctl_tx_rsfec_enable),
  .ctl_tx_send_idle                     (ctl_tx_send_idle),
  .ctl_tx_send_rfi                      (ctl_tx_send_rfi),
  .ctl_tx_send_lfi                      (ctl_tx_send_lfi),
  .tx_axis_tready                       (tx_axis_tready),
  .tx_axis_tvalid                       (tx_axis_tvalid),
  .tx_axis_tdata                        (tx_axis_tdata),
  .tx_axis_tkeep                        (tx_axis_tkeep),
  .tx_axis_tlast                        (tx_axis_tlast),
  .tx_axis_tuser                        (tx_axis_tuser),
  .tx_ovfout                            (tx_ovfout),
  .tx_unfout                            (tx_unfout),
  .tx_preamblein                        (tx_preamblein),

  .tx_reset_done                        (tx_reset_done),
  .rx_reset_done                        (rx_reset_done),
  .rx_serdes_reset_done                 (rx_serdes_reset_done),
  .gt_reset_tx_done_out                 (gt_reset_tx_done),
  .gt_reset_rx_done_out                 (gt_reset_rx_done),
  .rx_serdes_clk                        (rx_serdes_clk),
  .qpll0clk_in                          (qpll0clk_in),
  .qpll0refclk_in                       (qpll0refclk_in),
  
  .qpll1clk_in                          (4'b0),
  .qpll1refclk_in                       (4'b0),
  .gtwiz_reset_qpll0lock_in             (gtwiz_reset_qpll0lock_in),
  .gtwiz_reset_qpll0reset_out           (gtwiz_reset_qpll0reset_out),
  .drp_clk                              (drp_clk),
  .drp_addr                             (drp_addr),
  .drp_di                               (drp_di),
  .drp_en                               (drp_en),
  .drp_do                               (drp_do),
  .drp_rdy                              (drp_rdy),
  .drp_we                               (drp_we)
);

// The CMAC shared logic is responsible for instancing the GT reference clock input buffers and
// the GTY COMMON primitive. Also manages resets and cdc crossing to those primitives. When
// multiple MGT banks are needed multiple COMMON primitives must be instanced.
cmac_shared_logic #(
  .N_COMMON(N_COMMON)
) cmac_shared_logic_inst (
  .gt_ref_clk_p                         (gt_ref_clk_p),
  .gt_ref_clk_n                         (gt_ref_clk_n),
  .gt_txusrclk2                         (gt_txusrclk2),
  .gt_ref_clk_out                       (gt_ref_clk_out),
  .gt_powergood                         (gtpowergood_int),
  .gt_rxusrclk2                         (gt_rxusrclk2),
  .rx_clk                               (rx_clk),
  .gt_tx_reset_in                       (gt_reset_tx_done),
  .gt_rx_reset_in                       (gt_reset_rx_done),
  .core_drp_reset                       (core_drp_reset),
  .core_tx_reset                        (core_tx_reset),
  .tx_reset_out                         (tx_reset_done),
  .core_rx_reset                        (core_rx_reset),
  .rx_reset_out                         (rx_reset_done),
  .rx_serdes_reset_out                  (rx_serdes_reset_done),
  .qpll0reset                           (qpll0reset),
  .qpll0lock                            (qpll0lock_out),
  .qpll0outclk                          (qpll0outclk_out),
  .qpll0outrefclk                       (qpll0outrefclk_out),
  .qpll1reset                           (1'd0),
  .qpll1lock                            (),
  .qpll1outclk                          (),
  .qpll1outrefclk                       (),
  .usr_tx_reset                         (usr_tx_reset),
  .usr_rx_reset                         (usr_rx_reset)
);

endmodule : cmac_usplus_core_support

