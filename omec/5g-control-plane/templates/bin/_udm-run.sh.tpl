#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udm/udm /tmp/coredump/
{{- end }}

cat /free5gc/config/udmcfg.conf

./free5gc/udm/udm -udmcfg /free5gc/config/udmcfg.conf
