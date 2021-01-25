#!/bin/bash
# Copyright 2021-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -ex

{{ if .Values.config.rosCore.debug }}
while true; do sleep 3600; done;
{{ else }}
source /opt/ros/melodic/setup.bash && roscore;
{{ end }}
