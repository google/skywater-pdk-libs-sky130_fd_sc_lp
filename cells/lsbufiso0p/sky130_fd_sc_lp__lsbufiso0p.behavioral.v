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


`ifndef SKY130_FD_SC_LP__LSBUFISO0P_BEHAVIORAL_V
`define SKY130_FD_SC_LP__LSBUFISO0P_BEHAVIORAL_V

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
    X    ,
    SLEEP,
    A
);

    // Module ports
    output X    ;
    input  SLEEP;
    input  A    ;

    // Module supplies
    supply1 DESTPWR;
    supply1 VPWR   ;
    supply0 VGND   ;
    supply1 DESTVPB;
    supply1 VPB    ;
    supply0 VNB    ;

    // Local signals
    wire sleepb    ;
    wire and0_out_X;

    //                                 Name         Output      Other arguments
    not                                not0        (sleepb    , SLEEP                    );
    and                                and0        (and0_out_X, sleepb, A                );
    sky130_fd_sc_lp__udp_pwrgood_pp$PG pwrgood_pp0 (X         , and0_out_X, DESTPWR, VGND);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__LSBUFISO0P_BEHAVIORAL_V