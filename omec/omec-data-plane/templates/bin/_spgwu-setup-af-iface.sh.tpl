#!/bin/sh

# Copyright 2019 Intel Corporation
# Copyright 2019-present Open Networking Foundation
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -ex

UL_IFACE="{{ .Values.config.spgwu.s1u.device }}-veth"
DL_IFACE="{{ .Values.config.spgwu.sgi.device }}-veth"

if ! ip link show $UL_IFACE; then
    s1u_mac=$(ip addr show dev s1u-net | awk '$1=="link/ether"{print $2}')
    ip link add $UL_IFACE type veth peer name l_$UL_IFACE
    ip link set $UL_IFACE up
    ip link set l_$UL_IFACE up
    ip link set dev $UL_IFACE address $s1u_mac
fi
if ! ip link show $DL_IFACE; then
    sgi_mac=$(ip addr show dev sgi-net | awk '$1=="link/ether"{print $2}')
    ip link add $DL_IFACE type veth peer name l_$DL_IFACE
    ip link set $DL_IFACE up
    ip link set l_$DL_IFACE up
    ip link set dev $DL_IFACE address $sgi_mac
fi

if ! ip addr show $UL_IFACE | grep inet; then
    s1u_ip=$(ip addr show s1u-net | grep inet | grep -v inet6 | awk '{print $2}')
    ip addr add $s1u_ip dev $UL_IFACE
fi
if ! ip addr show $DL_IFACE | grep inet; then
    sgi_ip=$(ip addr show sgi-net | grep inet | grep -v inet6 | awk '{print $2}')
    ip addr add $sgi_ip dev $DL_IFACE
fi

ip a
