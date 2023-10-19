#!/bin/bash

kubectl create configmap alertmanager-config --from-file alertmanager.yml
kubectl create configmap dashboard-config --from-file dashboard.yml
kubectl create configmap datasource-config --from-file datasource.yml
kubectl create configmap loki-config --from-file loki.yml
kubectl create configmap mimir-config --from-file mimir.yml

kubectl create configmap json-dashboard-config --from-file grafana-dashboards/*

# grafana agent configs
kubectl create configmap entrypoint-config --from-file grafana-agent/entrypoint.sh
kubectl create configmap prometheus-custom-config --from-file grafana-agent/prometheus-custom.yml
kubectl create configmap prometheus-config --from-file grafana-agent/prometheus.yml
kubectl create configmap promtail-config --from-file grafana-agent/promtail.yml

kubectl apply -f main.yml
