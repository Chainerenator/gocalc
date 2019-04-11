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

{{- define "basicAuth" -}}
   {{- range $value := .Values.secrets.basicAuth | split "\n" -}}
     {{- $result := split ":" $value -}}
     {{-  printf "%s:{PLAIN}%s\n" $result._0 ($result._1 | trimPrefix " ") -}}
   {{- end -}}
{{- end -}}


