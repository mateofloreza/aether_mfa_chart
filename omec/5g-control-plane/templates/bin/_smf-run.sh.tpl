#!/bin/sh

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /free5gc/smf/smf /tmp/coredump/
{{- end }}

cd /free5gc
sed -i "s/POD_IP/${POD_IP}/g" config/smfcfg.conf

cat config/smfcfg.conf
cat config/uerouting.conf

./smf/smf -smfcfg config/smfcfg.conf -uerouting config/uerouting.conf
