#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/nssf/nssf /tmp/coredump/
{{- end }}

cd /free5gc
cp /tmp/config/* config/
sed -i "s/POD_IP/${POD_IP}/g" config/nssfcfg.conf

cat config/free5GC.conf
cat config/nssfcfg.conf

./nssf/nssf -nssfcfg config/nssfcfg.conf
