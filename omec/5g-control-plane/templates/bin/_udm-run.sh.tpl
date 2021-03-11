#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udm/udm /tmp/coredump/
{{- end }}

cd /free5gc
cp /tmp/config/* config/

cat config/free5GC.conf
cat config/udmcfg.conf

./udm/udm -udmcfg config/udmcfg.conf
