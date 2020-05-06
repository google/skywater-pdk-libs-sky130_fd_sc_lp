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


`ifndef SKY130_FD_SC_LP__DLYBUF4S50KAPWR_BEHAVIORAL_V
`define SKY130_FD_SC_LP__DLYBUF4S50KAPWR_BEHAVIORAL_V

/**
 * dlybuf4s50kapwr: Delay Buffer 4-stage 0.50um length inner stage
 *                  gates on keep-alive power rail.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_lp__dlybuf4s50kapwr (
    X,
    A
);

    // Module ports
    output X;
    input  A;

    // Module supplies
    supply1 VPWR ;
    supply0 VGND ;
    supply1 KAPWR;
    supply1 VPB  ;
    supply0 VNB  ;

    // Local signals
    wire buf0_out_X;

    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__DLYBUF4S50KAPWR_BEHAVIORAL_V