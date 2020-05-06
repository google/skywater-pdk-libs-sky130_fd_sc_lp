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

specify
if ((!GATE)) (negedge SET_B => (Q -: SET_B ) ) = (0:0:0,0:0:0);  // delay is tfall
ifnone ( SET_B -=> Q ) = (0:0:0,0:0:0);
(D +=> Q ) = (0:0:0,0:0:0);  // delays are tris,tfall
(posedge GATE => (Q +: D ) ) = (0:0:0,0:0:0); // delays are tris,tfall
$width ( posedge GATE &&& COND1 , 1.0:1.0:1.0, 0, notifier);
$width ( negedge GATE &&& COND1 , 1.0:1.0:1.0, 0, notifier);
$recrem ( posedge SET_B , negedge GATE , 0:0:0, 0:0:0, notifier , AWAKE , AWAKE , SETB_delayed , GATE_delayed ) ;
$setuphold ( negedge GATE , posedge D , 0:0:0, 0:0:0, notifier , COND0 , COND0 , GATE_delayed , D_delayed ) ;
$setuphold ( negedge GATE , negedge D , 0:0:0, 0:0:0, notifier , COND0 , COND0 , GATE_delayed , D_delayed ) ;
$width (negedge SET_B &&& AWAKE , 1.0:1.0:1.0 , 0 , notifier);
$width (posedge SET_B &&& AWAKE , 1.0:1.0:1.0 , 0 , notifier);
endspecify