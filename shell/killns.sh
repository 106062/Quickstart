#!/bin/sh

## kill all svc under namespace
echo '===> killing svc under namespcae ' $1
kubectl delete ns $1
