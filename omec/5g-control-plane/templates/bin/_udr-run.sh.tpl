#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/udr/udr /tmp/coredump/
{{- end }}

cat /free5gc/config/udrcfg.conf

./free5gc/udr/udr -udrcfg /free5gc/config/udrcfg.conf
