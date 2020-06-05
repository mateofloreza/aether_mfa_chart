#!/bin/bash
#
# Copyright 2020-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

until bessctl run /opt/bess/bessctl/conf/spgwu; do
    sleep 2;
done;

# Add route to eNB
ip route add {{ .Values.networks.enb.subnet }} via {{ .Values.networks.s1u.gateway }}
# Add default gw to SGI gateway
ip route add default via {{ .Values.networks.sgi.gateway }} metric 110
