#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/nssf/nssf /tmp/coredump/
{{- end }}

cat /free5gc/config/nssfcfg.conf

./free5gc/nssf/nssf -nssfcfg /free5gc/config/nssfcfg.conf
