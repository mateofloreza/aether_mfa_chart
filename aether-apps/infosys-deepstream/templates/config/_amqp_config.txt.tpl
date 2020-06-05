# Copyright (c) 2018-2019, NVIDIA CORPORATION. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only

[message-broker]
password = {{ .Values.config.deepstream.amqp.password }}
hostname = {{ .Values.config.deepstream.amqp.host }}
username = {{ .Values.config.deepstream.amqp.username }}
port = {{ .Values.config.deepstream.amqp.port }}
exchange = amq.topic
topic = jetson
