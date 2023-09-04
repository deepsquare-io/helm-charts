{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "supervisor.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Convert labels to string like: key1="value1", key2="value2", ...
*/}}
{{- define "supervisor.metascheduler.labels" -}}
{{- $list := list -}}
{{- range $k, $v := .Values.config.metascheduler.labels -}}
{{- $list = append $list (printf "%s=%s" $k $v) -}}
{{- end -}}
{{ join ", " $list }}
{{- end -}}