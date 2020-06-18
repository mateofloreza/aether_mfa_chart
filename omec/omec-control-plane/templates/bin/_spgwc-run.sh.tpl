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

cp /etc/cp/config/{adc_rules.cfg,cp_config.cfg,interface.cfg,meter_profile.cfg,pcc_rules.cfg,sdf_rules.cfg,app_config.cfg} .
sed -i "s/CP_ADDR/$POD_IP/g" interface.cfg

. cp_config.cfg
ngic_controlplane $EAL_ARGS -- $APP_ARGS
