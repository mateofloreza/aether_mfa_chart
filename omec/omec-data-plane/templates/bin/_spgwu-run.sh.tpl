#!/bin/bash

# Copyright 2019 Intel Corporation
# Copyright 2019-present Open Networking Foundation
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only

set -ex

{{- if .Values.config.coreDump.enabled }}
cp /bin/ngic_dataplane /tmp/coredump/
{{- end }}

mkdir -p /opt/dp/config
cd /opt/dp/config
cp /etc/dp/config/{cdr.cfg,dp_config.cfg,interface.cfg} .

sed -i "s/DP_ADDR/$POD_IP/g" interface.cfg

source dp_config.cfg
ngic_dataplane $EAL_ARGS -- $APP_ARGS
