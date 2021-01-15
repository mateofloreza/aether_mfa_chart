#!/bin/bash
# Copyright 2021-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -ex

{{- range .Values.config.rosCore.droneList }}
echo "{{ .ipAddr }} {{ .domain }}" >> /etc/hosts
{{- end }}

{{ if .Values.config.rosCore.debug }}
while true; do sleep 3600; done;
{{ else }}
source /opt/ros/melodic/setup.bash && roscore;
{{ end }}
