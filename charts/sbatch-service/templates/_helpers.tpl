{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sbatch-service.name" -}}
{{- default (printf "%s-%s" .Release.Name) .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sbatch-service.redis.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "redis" "chartValues" .Values.redis "context" $) -}}
{{- end -}}
