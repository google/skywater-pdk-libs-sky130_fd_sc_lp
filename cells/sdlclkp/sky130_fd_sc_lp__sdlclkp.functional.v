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


`ifndef SKY130_FD_SC_LP__SDLCLKP_FUNCTIONAL_V
`define SKY130_FD_SC_LP__SDLCLKP_FUNCTIONAL_V

/**
 * sdlclkp: Scan gated clock.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p/sky130_fd_sc_lp__udp_dlatch_p.v"

`celldefine
module sky130_fd_sc_lp__sdlclkp (
    GCLK,
    SCE ,
    GATE,
    CLK
);

    // Module ports
    output GCLK;
    input  SCE ;
    input  GATE;
    input  CLK ;

    // Local signals
    wire m0              ;
    wire m0n             ;
    wire clkn            ;
    wire CLK_delayed     ;
    wire SCE_delayed     ;
    wire GATE_delayed    ;
    wire SCE_gate_delayed;
    wire SCE_GATE        ;

    //                            Delay       Name     Output    Other arguments
    not                                       not0    (m0n     , m0             );
    not                                       not1    (clkn    , CLK            );
    nor                                       nor0    (SCE_GATE, GATE, SCE      );
    sky130_fd_sc_lp__udp_dlatch$P `UNIT_DELAY dlatch0 (m0      , SCE_GATE, clkn );
    and                                       and0    (GCLK    , m0n, CLK       );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SDLCLKP_FUNCTIONAL_V