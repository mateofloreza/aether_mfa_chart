#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/nrf/nrf /tmp/coredump/
{{- end }}

#cat config files

cd /free5gc
cat ./config/free5GC.conf
cat ./config/nrfcfg.conf
cat /etc/hosts
cp /free5gc/config/nrfcfg.conf /tmp/nrfcfg.conf
sed -i "s/nrf.free5gc.org/${POD_IP}/g" /tmp/nrfcfg.conf
sed -i "s/POD_IP/${POD_IP}/g" /tmp/nrfcfg.conf
./nrf/nrf -nrfcfg /tmp/nrfcfg.conf
