/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_LP__SRSDFRTP_BEHAVIORAL_PP_V
`define SKY130_FD_SC_LP__SRSDFRTP_BEHAVIORAL_PP_V

/**
 * srsdfrtp: Scan flop with sleep mode, inverted reset, non-inverted
 *           clock, single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr_pp_pkg_sn/sky130_fd_sc_lp__udp_dff_pr_pp_pkg_sn.v"
`include "../../models/udp_mux_2to1/sky130_fd_sc_lp__udp_mux_2to1.v"
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_lp__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_lp__srsdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    SLEEP_B,
    KAPWR  ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  SLEEP_B;
    input  KAPWR  ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire RESET            ;
    wire mux_out          ;
    wire buf_Q            ;
    reg  notifier         ;
    wire D_delayed        ;
    wire SCD_delayed      ;
    wire SCE_delayed      ;
    wire RESET_B_delayed  ;
    wire CLK_delayed      ;
    wire awake            ;
    wire cond0            ;
    wire cond1            ;
    wire cond2            ;
    wire cond3            ;
    wire cond4            ;
    wire pwrgood_pp0_out_Q;

    //                                    Name         Output             Other arguments
    not                                   not0        (RESET            , RESET_B_delayed                                                  );
    sky130_fd_sc_lp__udp_mux_2to1         mux_2to10   (mux_out          , D_delayed, SCD_delayed, SCE_delayed                              );
    sky130_fd_sc_lp__udp_dff$PR_pp$PKG$sN dff0        (buf_Q            , mux_out, CLK_delayed, RESET, SLEEP_B, notifier, KAPWR, VGND, VPWR);
    assign awake = ( ( SLEEP_B === 1'b1 ) && awake );
    assign cond0 = ( ( RESET_B_delayed === 1'b1 ) && awake );
    assign cond1 = ( ( SCE_delayed === 1'b0 ) && cond0 && awake );
    assign cond2 = ( ( SCE_delayed === 1'b1 ) && cond0 && awake );
    assign cond3 = ( ( D_delayed !== SCD_delayed ) && cond0 && awake );
    assign cond4 = ( ( RESET_B === 1'b1 ) && awake );
    sky130_fd_sc_lp__udp_pwrgood_pp$PG    pwrgood_pp0 (pwrgood_pp0_out_Q, buf_Q, VPWR, VGND                                                );
    buf                                   buf0        (Q                , pwrgood_pp0_out_Q                                                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SRSDFRTP_BEHAVIORAL_PP_V