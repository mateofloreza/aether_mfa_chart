#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/ausf/ausf /tmp/coredump/
{{- end }}


cd /free5gc
#print config files
cat ./config/free5GC.conf
cat ./config/ausfcfg.conf
cp /free5gc/config/ausfcfg.conf /tmp/ausfcfg.conf
sed -i "s/POD_IP/${POD_IP}/g" /tmp/ausfcfg.conf
NRF_ADDR=$(dig +short nrf.omec.svc.cluster.local)
sed -i "s/nrf.free5gc.org/${NRF_ADDR}/g" /tmp/ausfcfg.conf
./ausf/ausf -ausfcfg /tmp/ausfcfg.conf
