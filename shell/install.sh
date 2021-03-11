#!/bin/bash

## create namespace
echo '===> create namespace' $1
kubectl create namespace $1

## helm add repo jenkins
#helm repo add jenkins https://charts.jenkins.io

## install jenkins in newnamespace
echo '===> install jenkins in' $1
helm install jenkins jenkins/jenkins -n $1 --set service.type=ClusterIP --values ./jks.yaml

## get secert with admin pwd
echo '===> admin secret is '
echo $(kubectl get secret --namespace $1 jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode)

## check all svc under ns
kubectl get all -n $1

## set svc to get public ip
kubectl patch svc jenkins -n $1 -p '{"spec": {"type": "LoadBalancer"}}'

