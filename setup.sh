#!/bin/bash

kubectl create configmap config-files --from-file configmaps
kubectl apply -f main.yml

# kubectl port-forward service/grafana-service --address 0.0.0.0 3000:3000
