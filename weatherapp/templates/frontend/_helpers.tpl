{{- define "weatherapp.frontend.fullname" -}}
{{ .Values.frontend.name }}
{{- end -}}

{{- define "weatherapp.frontend.labels" -}}
app: {{ .Values.frontend.labels.app | quote }}
tier: {{ .Values.frontend.labels.tier | quote }}
env: {{ .Values.env | quote }}
{{- end -}}

{{- define "weatherapp.frontend.probes" -}}

readinessProbe:
  httpGet:
    path: /
    port: 80
  initialDelaySeconds: 5
  periodSeconds: 5

livenessProbe:
  httpGet:
    path: /
    port: 80
  initialDelaySeconds: 30
  periodSeconds: 10

{{- end -}}