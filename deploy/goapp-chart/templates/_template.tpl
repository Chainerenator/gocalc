{{- define "namespace" -}}
  {{- .Release.Namespace -}}
{{- end -}}

{{- define "nodeSelector" -}}
      {{- range $key, $value := .Values.deployment.nodelabels }}
{{ $key }}: {{ $value }}
      {{- end }}
{{- end -}}

{{- define "goappImage" -}}
  {{- $goappImageRegistry := .Values.pods.goapp.dockerhubUrl.registry -}}
  {{- $goappImageRepo := .Values.pods.goapp.dockerhubUrl.repository -}}
  {{- $goappImageTag := .Values.pods.goapp.dockerhubUrl.tag -}}
  {{- $goappImageRegistry -}}/{{- $goappImageRepo -}}:{{- $goappImageTag -}}
{{- end -}}

{{- define "goappConf" -}}
  {{- .Values.pods.nginx.mount.configMap -}}
{{- end -}}


