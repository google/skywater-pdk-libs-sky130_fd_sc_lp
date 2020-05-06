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

`ifndef SKY130_FD_SC_LP__EINVP_LP_V
`define SKY130_FD_SC_LP__EINVP_LP_V

/**
 * einvp: Tri-state inverter, positive enable.
 *
 * Verilog wrapper for einvp with size for low power.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__einvp.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__einvp_lp (
    Z   ,
    A   ,
    TE  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Z   ;
    input  A   ;
    input  TE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    sky130_fd_sc_lp__einvp cell (
        .Z(Z),
        .A(A),
        .TE(TE),
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
module sky130_fd_sc_lp__einvp_lp (
    Z   ,
    A   ,
    TE  ,
    VPWR,
    VGND,
    VPB ,
    VNB
);

    output Z   ;
    input  A   ;
    input  TE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_lp__einvp cell (
        .Z(Z),
        .A(A),
        .TE(TE)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_LP__EINVP_LP_V
