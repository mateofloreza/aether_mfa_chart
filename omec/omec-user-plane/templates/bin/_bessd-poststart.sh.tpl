#!/bin/bash

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -ex

until bessctl run /opt/bess/bessctl/conf/spgwu; do
    sleep 2;
done;

# Add route to eNB
ip route add {{ .Values.networks.enb.subnet }} via {{ .Values.networks.s1u.gateway }}
# Add default gw to SGI gateway
ip route add default via {{ .Values.networks.sgi.gateway }} metric 110
