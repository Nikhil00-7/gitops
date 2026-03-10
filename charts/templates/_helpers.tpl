{{- define "charts.backend.fullname" -}}
{{ .Values.backend.app.name }}
{{- end -}}

{{- define "charts.frontend.fullname" -}}
{{ .Values.frontend.app.name }}
{{- end -}}

{{- define "backend.labels" -}}
app: {{ .Values.backend.app.labels.app | quote }}
tier: {{ .Values.backend.app.labels.tier | quote }}
env: {{ .Values.backend.app.labels.env | quote }}
{{- end -}}

{{- define "frontend.labels" -}}
app: {{ .Values.frontend.app.labels.app | quote }}
tier: {{ .Values.frontend.app.labels.tier | quote }}
env: {{ .Values.frontend.app.labels.env | quote }}
{{- end -}}

{{- define "weather-app.strategy" -}}
type: {{ .Values.strategy.type | default "RollingUpdate" | quote }}
{{- if eq (.Values.strategy.type | default "RollingUpdate") "RollingUpdate" }}
rollingUpdate:
  maxUnavailable: {{ .Values.strategy.rollingUpdate.maxUnavailable | default 0 | quote }}
  maxSurge: {{ .Values.strategy.rollingUpdate.maxSurge | default 1 | quote }}
{{- end }}
{{- end -}}

{{- define "weather-app.securityContext" -}}
runAsNonRoot: {{ .Values.securityContext.runAsNonRoot | default true }}
runAsUser: {{ .Values.securityContext.runAsUser | default 1000 }}
fsGroup: {{ .Values.securityContext.fsGroup | default 1000 }}
{{- end -}}

{{- define "weather-app.resources" -}}
requests:
  cpu: {{ .Values.resources.requests.cpu | default "200m" | quote }}
  memory: {{ .Values.resources.requests.memory | default "256Mi" | quote }}
limits:
  cpu: {{ .Values.resources.limits.cpu | default "500m" | quote }}
  memory: {{ .Values.resources.limits.memory | default "512Mi" | quote }}
{{- end -}}

{{- define "weather-app.autoscaling" -}}
minReplicas: {{ .Values.autoscaling.minReplicas | default 1 }}
maxReplicas: {{ .Values.autoscaling.maxReplicas | default 10 }}
targetCPUUtilizationPercentage: {{ .Values.autoscaling.targetCPUUtilizationPercentage | default 80 }}
{{- end -}}