{{- define "weatherapp.fullname" -}}
{{ .Values.backend.name }}
{{- end -}}

{{- define "weatherapp.labels" -}}
app: {{ .Values.backend.labels.app | quote }}
tier: {{ .Values.backend.labels.tier | quote }}
env: {{ .Values.env | quote }}
{{- end -}}

{{- define "weatherapp.probes" -}}

readinessProbe:
  httpGet:
    path: /health
    port: 8000
  initialDelaySeconds: 5
  periodSeconds: 5

startupProbe:
  httpGet:
    path: /health
    port: 8000
  initialDelaySeconds: 15
  periodSeconds: 5
  failureThreshold: 3

livenessProbe:
  httpGet:
    path: /health
    port: 8000
  initialDelaySeconds: 30
  periodSeconds: 10

{{- end -}}