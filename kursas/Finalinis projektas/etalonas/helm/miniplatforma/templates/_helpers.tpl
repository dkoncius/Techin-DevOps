{{- define "mp.secretName" -}}
{{- if .Values.db.existingSecret -}}{{ .Values.db.existingSecret }}{{- else -}}{{ .Release.Name }}-db{{- end -}}
{{- end -}}
{{- define "mp.dbHost" -}}{{ .Release.Name }}-postgres{{- end -}}
