#!/bin/bash

kubectl delete -f main.yml

kubectl delete configmap alertmanager-config
kubectl delete configmap dashboard-config
kubectl delete configmap datasource-config
kubectl delete configmap loki-config
kubectl delete configmap mimir-config

kubectl delete configmap json-dashboard-config

# grafana agent configs
kubectl delete configmap entrypoint-config
kubectl delete configmap prometheus-custom-config
kubectl delete configmap prometheus-config
kubectl delete configmap promtail-config
