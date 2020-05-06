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


`ifndef SKY130_FD_SC_LP__BUSDRIVERNOVLPSLEEP_BEHAVIORAL_V
`define SKY130_FD_SC_LP__BUSDRIVERNOVLPSLEEP_BEHAVIORAL_V

/**
 * busdrivernovlpsleep: Bus driver, enable gates pulldown only,
 *                      non-inverted sleep input (on kapwr rail).
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_lp__busdrivernovlpsleep (
    Z    ,
    A    ,
    TE_B ,
    SLEEP
);

    // Module ports
    output Z    ;
    input  A    ;
    input  TE_B ;
    input  SLEEP;

    // Module supplies
    supply1 VPWR ;
    supply0 VGND ;
    supply1 KAPWR;
    supply1 VPB  ;
    supply0 VNB  ;

    // Local signals
    wire nor_teb_SLEEP;
    wire zgnd         ;
    wire zpwr         ;

    //     Name     Output         Other arguments
    nor    nor0    (nor_teb_SLEEP, TE_B, SLEEP        );
    bufif1 bufif10 (zgnd         , A, VPWR            );
    bufif0 bufif00 (zpwr         , zgnd, VGND         );
    bufif1 bufif11 (Z            , zpwr, nor_teb_SLEEP);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__BUSDRIVERNOVLPSLEEP_BEHAVIORAL_V