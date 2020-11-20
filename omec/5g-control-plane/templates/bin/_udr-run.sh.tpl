#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udr/udr /tmp/coredump/
{{- end }}

#cat config files

cd /free5gc
cat ./config/free5GC.conf
cat ./config/udrcfg.conf
cat /etc/hosts
cp /free5gc/config/udrcfg.conf /tmp/udrcfg.conf
sed -i "s/POD_IP/${POD_IP}/g" /tmp/udrcfg.conf
NRF_ADDR=$(dig +short nrf.omec.svc.cluster.local)
sed -i "s/nrf.free5gc.org/${NRF_ADDR}/g" /tmp/udrcfg.conf
./udr/udr -udrcfg /tmp/udrcfg.conf 
