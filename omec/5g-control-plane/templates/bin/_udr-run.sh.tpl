#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udr/udr /tmp/coredump/
{{- end }}

cd /free5gc
cp /tmp/config/* config/
sed -i "s/POD_IP/${POD_IP}/g" config/udrcfg.conf

cat config/free5GC.conf
cat config/udrcfg.conf

./udr/udr -udrcfg config/udrcfg.conf
