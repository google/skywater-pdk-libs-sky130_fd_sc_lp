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

`ifndef SKY130_FD_SC_LP__SRSDFXTP_TB_V
`define SKY130_FD_SC_LP__SRSDFXTP_TB_V

/**
 * srsdfxtp: Scan flop with sleep mode, non-inverted clock,
 *           single output.
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__srsdfxtp.v"

module top();

    // Inputs are registered
    reg D;
    reg SCD;
    reg SCE;
    reg SLEEP_B;
    reg KAPWR;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;

    // Outputs are wires
    wire Q;

    initial
    begin
        // Initial state is x for all inputs.
        D       = 1'bX;
        KAPWR   = 1'bX;
        SCD     = 1'bX;
        SCE     = 1'bX;
        SLEEP_B = 1'bX;
        VGND    = 1'bX;
        VNB     = 1'bX;
        VPB     = 1'bX;
        VPWR    = 1'bX;

        #20   D       = 1'b0;
        #40   KAPWR   = 1'b0;
        #60   SCD     = 1'b0;
        #80   SCE     = 1'b0;
        #100  SLEEP_B = 1'b0;
        #120  VGND    = 1'b0;
        #140  VNB     = 1'b0;
        #160  VPB     = 1'b0;
        #180  VPWR    = 1'b0;
        #200  D       = 1'b1;
        #220  KAPWR   = 1'b1;
        #240  SCD     = 1'b1;
        #260  SCE     = 1'b1;
        #280  SLEEP_B = 1'b1;
        #300  VGND    = 1'b1;
        #320  VNB     = 1'b1;
        #340  VPB     = 1'b1;
        #360  VPWR    = 1'b1;
        #380  D       = 1'b0;
        #400  KAPWR   = 1'b0;
        #420  SCD     = 1'b0;
        #440  SCE     = 1'b0;
        #460  SLEEP_B = 1'b0;
        #480  VGND    = 1'b0;
        #500  VNB     = 1'b0;
        #520  VPB     = 1'b0;
        #540  VPWR    = 1'b0;
        #560  VPWR    = 1'b1;
        #580  VPB     = 1'b1;
        #600  VNB     = 1'b1;
        #620  VGND    = 1'b1;
        #640  SLEEP_B = 1'b1;
        #660  SCE     = 1'b1;
        #680  SCD     = 1'b1;
        #700  KAPWR   = 1'b1;
        #720  D       = 1'b1;
        #740  VPWR    = 1'bx;
        #760  VPB     = 1'bx;
        #780  VNB     = 1'bx;
        #800  VGND    = 1'bx;
        #820  SLEEP_B = 1'bx;
        #840  SCE     = 1'bx;
        #860  SCD     = 1'bx;
        #880  KAPWR   = 1'bx;
        #900  D       = 1'bx;
    end

    // Create a clock
    reg CLK;
    initial
    begin
        CLK = 1'b0;
    end

    always
    begin
        #5 CLK = ~CLK;
    end

    sky130_fd_sc_lp__srsdfxtp dut (.D(D), .SCD(SCD), .SCE(SCE), .SLEEP_B(SLEEP_B), .KAPWR(KAPWR), .VPWR(VPWR), .VGND(VGND), .VPB(VPB), .VNB(VNB), .Q(Q), .CLK(CLK));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SRSDFXTP_TB_V
