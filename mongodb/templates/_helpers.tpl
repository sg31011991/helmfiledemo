{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "wordpress.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wordpress.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wordpress.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels for wordpress
*/}}
{{- define "wordpress.labels" -}}
app.kubernetes.io/name: {{ include "wordpress.name" . }}
helm.sh/chart: {{ include "wordpress.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels for wordpress
*/}}
{{- define "wordpress.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wordpress.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Name of mongodb
*/}}
{{- define "mongodb.name" -}}
db
{{- end -}}

{{/*
Create a default fully qualified mongodb name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mongodb.fullname" -}}
{{- printf "%s-%s" .Release.Name "db" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create mongodb pvc name
*/}}
{{- define "mongodb.pvc" -}}
{{ include "mongodb.fullname" . }}-data
{{- end -}}

{{/*
Create mongodb secrets name
*/}}
{{- define "mongodb.secrets" -}}
{{ include "mongodb.fullname" . }}-secrets
{{- end -}}


{{/*
Common labels for mongodb
*/}}
{{- define "mongodb.labels" -}}
app.kubernetes.io/name: {{ include "mongodb.name" . }}
helm.sh/chart: {{ include "wordpress.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels for mongodb
*/}}
{{- define "mongodb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mongodb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
