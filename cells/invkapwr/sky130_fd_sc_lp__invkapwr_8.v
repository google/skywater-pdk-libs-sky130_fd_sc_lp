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

`ifndef SKY130_FD_SC_LP__INVKAPWR_8_V
`define SKY130_FD_SC_LP__INVKAPWR_8_V

/**
 * invkapwr: Inverter on keep-alive power rail.
 *
 * Verilog wrapper for invkapwr with size of 8 units.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__invkapwr.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__invkapwr_8 (
    Y    ,
    A    ,
    VPWR ,
    VGND ,
    KAPWR,
    VPB  ,
    VNB
);

    output Y    ;
    input  A    ;
    input  VPWR ;
    input  VGND ;
    input  KAPWR;
    input  VPB  ;
    input  VNB  ;
    sky130_fd_sc_lp__invkapwr cell (
        .Y(Y),
        .A(A),
        .VPWR(VPWR),
        .VGND(VGND),
        .KAPWR(KAPWR),
        .VPB(VPB),
        .VNB(VNB)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__invkapwr_8 (
    Y    ,
    A    ,
    VPWR ,
    VGND ,
    KAPWR,
    VPB  ,
    VNB
);

    output Y    ;
    input  A    ;
    input  VPWR ;
    input  VGND ;
    input  KAPWR;
    input  VPB  ;
    input  VNB  ;

    // Voltage supply signals
    supply1 VPWR ;
    supply0 VGND ;
    supply1 KAPWR;
    supply1 VPB  ;
    supply0 VNB  ;

    sky130_fd_sc_lp__invkapwr cell (
        .Y(Y),
        .A(A)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_LP__INVKAPWR_8_V