#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/ausf/ausf /tmp/coredump/
{{- end }}

cat /free5gc/config/ausfcfg.conf

./free5gc/ausf/ausf -ausfcfg /free5gc/config/ausfcfg.conf
