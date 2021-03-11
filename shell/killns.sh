#!/bin/sh

## kill all svc under namespace
echo '===> killing svc under and namespcae ' $1
kubectl delete ns $1

