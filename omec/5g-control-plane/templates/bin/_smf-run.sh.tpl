#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/smf/smf /tmp/coredump/
{{- end }}

#cat config files

cd /free5gc
cat ./config/free5GC.conf
cat ./config/smfcfg.conf
cat ./config/uerouting.yaml
cat /etc/hosts
cp /free5gc/config/smfcfg.conf /tmp/smfcfg.conf
sed -i "s/POD_IP/${POD_IP}/g" /tmp/smfcfg.conf
NRF_ADDR=$(dig +short nrf.omec.svc.cluster.local)
sed -i "s/nrf.free5gc.org/${NRF_ADDR}/g" /tmp/smfcfg.conf
./smf/smf -smfcfg /tmp/smfcfg.conf -uerouting ./config/uerouting.yaml
