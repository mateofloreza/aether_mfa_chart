#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/pcf/pcf /tmp/coredump/
{{- end }}

cat /free5gc/config/pcfcfg.conf

./free5gc/pcf/pcf -pcfcfg /free5gc/config/pcfcfg.conf
