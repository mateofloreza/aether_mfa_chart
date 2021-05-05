#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/amf/amf /tmp/coredump/
{{- end }}

cat /free5gc/config/amfcfg.conf

./free5gc/amf/amf -amfcfg /free5gc/config/amfcfg.conf
