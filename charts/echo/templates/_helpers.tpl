{{- define "echo.name" -}}
{{- default .Chart.Name .Values.name -}}
{{- end -}}

{{- define "echo.fullname" -}}
{{- printf "%s-%s" (include "echo.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
