{{- /*

# Copyright 2019-present Open Networking Foundation
#
# SPDX-License-Identifier: Apache-2.0
# SPDX-License-Identifier: LicenseRef-ONF-Member-Only

*/ -}}

{{/*
Render a set of standardised label
*/}}
{{- define "accelleran-cbrs-cu.metadata_labels" -}}
{{- $application := index . 0 -}}
{{- $context := index . 1 -}}
release: {{ $context.Release.Name }}
app: {{ $application }}
{{- end -}}

