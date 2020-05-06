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


`ifndef SKY130_FD_SC_LP__LSBUFISO0P_FUNCTIONAL_PP_V
`define SKY130_FD_SC_LP__LSBUFISO0P_FUNCTIONAL_PP_V

/**
 * lsbufiso0p: ????.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_lp__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_lp__lsbufiso0p (
    X      ,
    SLEEP  ,
    A      ,
    DESTPWR,
    VPWR   ,
    VGND   ,
    DESTVPB,
    VPB    ,
    VNB
);

    // Module ports
    output X      ;
    input  SLEEP  ;
    input  A      ;
    input  DESTPWR;
    input  VPWR   ;
    input  VGND   ;
    input  DESTVPB;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire sleepb                ;
    wire pwrgood_pp0_out_A     ;
    wire pwrgood_pp1_out_sleepb;
    wire and0_out_X            ;

    //                                 Name         Output                  Other arguments
    not                                not0        (sleepb                , SLEEP                                    );
    sky130_fd_sc_lp__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_A     , A, VPWR, VGND                            );
    sky130_fd_sc_lp__udp_pwrgood_pp$PG pwrgood_pp1 (pwrgood_pp1_out_sleepb, sleepb, DESTPWR, VGND                    );
    and                                and0        (and0_out_X            , pwrgood_pp1_out_sleepb, pwrgood_pp0_out_A);
    sky130_fd_sc_lp__udp_pwrgood_pp$PG pwrgood_pp2 (X                     , and0_out_X, DESTPWR, VGND                );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__LSBUFISO0P_FUNCTIONAL_PP_V