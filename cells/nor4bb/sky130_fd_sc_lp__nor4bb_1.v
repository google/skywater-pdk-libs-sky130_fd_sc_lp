/**
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

`ifndef SKY130_FD_SC_LP__NOR4BB_1_V
`define SKY130_FD_SC_LP__NOR4BB_1_V

/**
 * nor4bb: 4-input NOR, first two inputs inverted.
 *
 * Verilog wrapper for nor4bb with size of 1 units.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__nor4bb.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__nor4bb_1 (
    Y   ,
    A   ,
    B   ,
    C_N ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Y   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    sky130_fd_sc_lp__nor4bb cell (
        .Y(Y),
        .A(A),
        .B(B),
        .C_N(C_N),
        .D_N(D_N),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__nor4bb_1 (
    Y   ,
    A   ,
    B   ,
    C_N ,
    D_N ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Y   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_lp__nor4bb cell (
        .Y(Y),
        .A(A),
        .B(B),
        .C_N(C_N),
        .D_N(D_N)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_LP__NOR4BB_1_V
