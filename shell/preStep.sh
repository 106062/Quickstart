#!/bin/bash

## quick install helm for pre-install jks on k8s
## if you start from gke to create your k8s test env need install gke tools follow this
## curl https://dl.google.com/dl/cloudsdk/release/install_google_cloud_sdk.bash | bash
## sudo apt-get update && sudo apt-get install google-cloud-sdk
## sudo apt-get install google-cloud-sdk-app-engine-java
## gcloud init

## rember to grant rbac to your jks service account

## cat <<EOF | kubectl apply -f -
## kind: ClusterRole
## apiVersion: rbac.authorization.k8s.io/v1
## metadata:
##   namespace: jenkins2
##   name: access-pod
## rules:
##   - apiGroups: [""]
##     resources: ["services"]
##     verbs: ["get", "watch", "list"]
##   - apiGroups: [""]
##     resources: ["pods"]
##     verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
## EOF
## kubectl create clusterrolebinding access-pod-rolebinding --clusterrole=access-pod --serviceaccount=jenkins:default

## have to install helm

## sudo curl https://baltocdn.com/helm/signing.asc | sudo apt-key add
## sudo apt-get install apt-transport-https --yes
## echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
## sudo apt-get update 
## sudo apt-get install helm
