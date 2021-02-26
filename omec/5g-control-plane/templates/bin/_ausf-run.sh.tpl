#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/ausf/ausf /tmp/coredump/
{{- end }}

cd /free5gc
cp /tmp/config/* config/
sed -i "s/POD_IP/${POD_IP}/g" config/ausfcfg.conf

cat config/free5GC.conf
cat config/ausfcfg.conf

./ausf/ausf -ausfcfg config/ausfcfg.conf