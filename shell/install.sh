#!/bin/bash

kubectl create namespace $1

## helm add repo jenkins
helm repo add jenkins https://charts.jenkins.io

## install jenkins in newnamespace
echo 'install jenkins in' $1
#helm install jenkins jenkins/jenkins -n $1  --set service.type=ClusterIP

## get secert with admin pwd
echo $(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode)

## set svc to get public ip
kubectl patch svc jenkins -n $1 -p '{"spec": {"type": "LoadBalancer"}}'

