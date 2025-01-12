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
Create a version as used by the chart and image tag.
*/}}
{{- define "zesty-k8s.version" -}}
{{ default .Chart.AppVersion .Values.image.tag  }}
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
Create a name for the Secret
*/}}
{{- define "zesty-k8s.secret" -}}
{{ printf "%s-secret" (include "zesty-k8s.fullname" .) }}
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
Create a name for the Role
*/}}
{{- define "zesty-k8s.role" -}}
{{ printf "%s-role" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the RoleBinding
*/}}
{{- define "zesty-k8s.rolebinding" -}}
{{ printf "%s-roleBinding" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the Service
*/}}
{{- define "zesty-k8s.svc" -}}
{{ printf "%s-svc" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the AutoUpdate Role
*/}}
{{- define "zesty-k8s.autoupdate-role" -}}
{{ printf "%s-autoupdate-role" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the AutoUpdate RoleBinding
*/}}
{{- define "zesty-k8s.autoupdate-rolebinding" -}}
{{ printf "%s-autoupdate-roleBinding" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the AutoUpdate SA
*/}}
{{- define "zesty-k8s.autoupdate-saname" -}}
{{ printf "%s-autoupdate-sa" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the AutoUpdate ClusterRole
*/}}
{{- define "zesty-k8s.autoupdate-clusterrole" -}}
{{ printf "%s-autoupdate-clusterRole" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
Create a name for the AutoUpdate ClusterRoleBinding
*/}}
{{- define "zesty-k8s.autoupdate-clusterrolebinding" -}}
{{ printf "%s-autoupdate-clusterRoleBinding" (include "zesty-k8s.fullname" .) }}
{{- end -}}

{{/*
All of the relevant verbs
*/}}
{{- define "zesty-k8s.verbs" -}}
verbs:
  - get
  - list
  {{- if .Values.config.manager.enable }}
  - patch
  {{- end }}
  - watch
{{- end -}}
