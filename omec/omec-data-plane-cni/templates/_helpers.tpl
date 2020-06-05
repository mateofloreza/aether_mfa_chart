{{- /*

# Copyright 2019-present Open Networking Foundation
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only

*/ -}}

{{/*
Renders a set of standardised labels.
*/}}
{{- define "omec-data-plane-cni.metadata_labels" -}}
{{- $application := index . 0 -}}
{{- $context := index . 1 -}}
release: {{ $context.Release.Name }}
app: {{ $application }}
{{- end -}}
