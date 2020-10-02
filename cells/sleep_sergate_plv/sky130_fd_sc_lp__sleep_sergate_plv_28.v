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

`ifndef SKY130_FD_SC_LP__SLEEP_SERGATE_PLV_28_V
`define SKY130_FD_SC_LP__SLEEP_SERGATE_PLV_28_V

/**
 * sleep_sergate_plv: connect vpr to virtpwr when not in sleep mode.
 *
 * Verilog wrapper for sleep_sergate_plv with size of 28 units
 * (invalid?).
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_lp__sleep_sergate_plv.v"

`ifdef USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__sleep_sergate_plv_28 (
    VIRTPWR,
    SLEEP  ,
    VPWR   ,
    VPB    ,
    VNB
);

    output VIRTPWR;
    input  SLEEP  ;
    input  VPWR   ;
    input  VPB    ;
    input  VNB    ;
    sky130_fd_sc_lp__sleep_sergate_plv base (
        .VIRTPWR(VIRTPWR),
        .SLEEP(SLEEP),
        .VPWR(VPWR),
        .VPB(VPB),
        .VNB(VNB)
    );

endmodule
`endcelldefine

/*********************************************************/
`else // If not USE_POWER_PINS
/*********************************************************/

`celldefine
module sky130_fd_sc_lp__sleep_sergate_plv_28 (
    VIRTPWR,
    SLEEP  ,
    VPWR   ,
    VPB    ,
    VNB
);

    output VIRTPWR;
    input  SLEEP  ;
    input  VPWR   ;
    input  VPB    ;
    input  VNB    ;

    // Voltage supply signals
    supply1 VPWR;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_lp__sleep_sergate_plv base (
        .VIRTPWR(VIRTPWR),
        .SLEEP(SLEEP)
    );

endmodule
`endcelldefine

/*********************************************************/
`endif // USE_POWER_PINS

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SLEEP_SERGATE_PLV_28_V
