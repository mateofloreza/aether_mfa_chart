#!/bin/bash

# Copyright 2020-present Open Networking Foundation
#
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only-1.0

set -ex

until bessctl run /opt/bess/bessctl/conf/up4; do
    sleep 2;
done;

ping {{ .Values.config.upf.access.gateway }} -c 5;
ping {{ .Values.config.upf.core.gateway }} -c 5;
