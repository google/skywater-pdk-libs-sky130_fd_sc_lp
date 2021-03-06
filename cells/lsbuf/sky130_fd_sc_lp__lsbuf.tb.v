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

`ifndef SKY130_FD_SC_LP__LSBUF_TB_V
`define SKY130_FD_SC_LP__LSBUF_TB_V

/**
 * lsbuf: ????.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__lsbuf.v"

module top();

    // Inputs are registered
    reg A;
    reg DESTPWR;
    reg VPWR;
    reg VGND;
    reg DESTVPB;
    reg VPB;
    reg VNB;

    // Outputs are wires
    wire X;

    initial
    begin
        // Initial state is x for all inputs.
        A       = 1'bX;
        DESTPWR = 1'bX;
        DESTVPB = 1'bX;
        VGND    = 1'bX;
        VNB     = 1'bX;
        VPB     = 1'bX;
        VPWR    = 1'bX;

        #20   A       = 1'b0;
        #40   DESTPWR = 1'b0;
        #60   DESTVPB = 1'b0;
        #80   VGND    = 1'b0;
        #100  VNB     = 1'b0;
        #120  VPB     = 1'b0;
        #140  VPWR    = 1'b0;
        #160  A       = 1'b1;
        #180  DESTPWR = 1'b1;
        #200  DESTVPB = 1'b1;
        #220  VGND    = 1'b1;
        #240  VNB     = 1'b1;
        #260  VPB     = 1'b1;
        #280  VPWR    = 1'b1;
        #300  A       = 1'b0;
        #320  DESTPWR = 1'b0;
        #340  DESTVPB = 1'b0;
        #360  VGND    = 1'b0;
        #380  VNB     = 1'b0;
        #400  VPB     = 1'b0;
        #420  VPWR    = 1'b0;
        #440  VPWR    = 1'b1;
        #460  VPB     = 1'b1;
        #480  VNB     = 1'b1;
        #500  VGND    = 1'b1;
        #520  DESTVPB = 1'b1;
        #540  DESTPWR = 1'b1;
        #560  A       = 1'b1;
        #580  VPWR    = 1'bx;
        #600  VPB     = 1'bx;
        #620  VNB     = 1'bx;
        #640  VGND    = 1'bx;
        #660  DESTVPB = 1'bx;
        #680  DESTPWR = 1'bx;
        #700  A       = 1'bx;
    end

    sky130_fd_sc_lp__lsbuf dut (.A(A), .DESTPWR(DESTPWR), .VPWR(VPWR), .VGND(VGND), .DESTVPB(DESTVPB), .VPB(VPB), .VNB(VNB), .X(X));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_LP__LSBUF_TB_V
