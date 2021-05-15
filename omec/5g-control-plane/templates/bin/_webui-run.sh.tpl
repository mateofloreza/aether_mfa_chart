#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/webconsole/webui /tmp/coredump/
{{- end }}

cat /free5gc/config/webuicfg.conf

./free5gc/webconsole/webconsole -webuicfg /free5gc/config/webuicfg.conf
