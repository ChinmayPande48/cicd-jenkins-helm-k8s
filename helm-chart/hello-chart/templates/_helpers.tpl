{{- define "hello-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "hello-chart.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "hello-chart.fullname" -}}
{{ printf "%s-%s" (include "hello-chart.name" .) .Release.Name }}
{{- end -}}
