#!/bin/bash

# Copyright 2019-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -xe

{{- if .Values.config.coreDump.enabled }}
cp /bin/ngic_controlplane /tmp/coredump/
{{- end }}

mkdir -p /opt/cp/config
cd /opt/cp/config
cp /etc/cp/config/{*.cfg,*.json} .

if [ ! -d "/dev/hugepages" ]; then
    MEMORY="--no-huge -m $((MEM_LIMIT-1024))"
fi
CORES="-c $(taskset -p $$ | awk '{print $NF}')"
EAL_ARGS="${CORES} ${MEMORY} --no-pci"

cat /opt/cp/config/subscriber_mapping.json
ngic_controlplane $EAL_ARGS -- -f /etc/cp/config/
