#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udm/udm /tmp/coredump/
{{- end }}

#cat config files

cd /free5gc
cat ./config/free5GC.conf
cat ./config/udmcfg.conf
cat /etc/hosts
cp /free5gc/config/udmcfg.conf /tmp/udmcfg.conf
sed -i "s/POD_IP/${POD_IP}/g" /tmp/udmcfg.conf
NRF_ADDR=$(dig +short nrf.omec.svc.cluster.local)
sed -i "s/nrf.free5gc.org/${NRF_ADDR}/g" /tmp/udmcfg.conf
./udm/udm -udmcfg /tmp/udmcfg.conf 
