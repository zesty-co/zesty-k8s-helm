{{/*
Expand the name of the chart.
*/}}
{{- define "zesty-k8s.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zesty-k8s.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "zesty-k8s.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a namespace name used by the chart.
*/}}
{{- define "zesty-k8s.namespace" -}}
{{ default .Release.Namespace .Values.namespaceOverride }}
{{- end -}}

{{/*
Create a name for the SA
*/}}
{{- define "zesty-k8s.saname" -}}
{{ printf "%s-sa" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the PVC
*/}}
{{- define "zesty-k8s.pvcname" -}}
{{ printf "%s-pvc" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the external-secret
*/}}
{{- define "zesty-k8s.externalSecret.awsCred" -}}
{{ printf "%s-aws-cluster-secret" (include "zesty-k8s.fullname" .) }}
{{- end -}}


{{/*
Create a name for the ConfigMap
*/}}
{{- define "zesty-k8s.configmap" -}}
{{ printf "%s-cm" (include "zesty-k8s.fullname" .) }}
{{- end -}}


{{/*
Create a name for the ClusterRole
*/}}
{{- define "zesty-k8s.clusterrole" -}}
{{ printf "%s-clusterRole" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the ClusterRoleBinding
*/}}
{{- define "zesty-k8s.clusterrolebinding" -}}
{{ printf "%s-clusterRoleBinding" (include "zesty-k8s.fullname" .) }}
{{- end -}}


{{/*
All of the relevant verbs
*/}}
{{- define "zesty-k8s.verbs" -}}
verbs:
  - get
  - list
  - watch
{{- end -}}
