#!/bin/bash

kubectl create configmap org-loki-config --from-file org-loki.yml
kubectl create configmap org-prom-config --from-file org-prom.yml
kubectl create configmap prometheus-config --from-file prometheus.yml
kubectl create configmap prometheus-custom-config --from-file prometheus-custom.yml
kubectl create configmap promtail-config --from-file promtail.yml
kubectl create configmap entrypoint-config --from-file entrypoint.sh

kubectl apply -f main.yml
