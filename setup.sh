#!/bin/bash

kubectl create namespace grafana-agent

kubectl -n grafana-agent create configmap test-promtail-config --from-file test-promtail.yml

kubectl -n grafana-agent create configmap alertmanager-config --from-file alertmanager.yml
kubectl -n grafana-agent create configmap dashboard-config --from-file dashboard.yml
kubectl -n grafana-agent create configmap datasource-config --from-file datasource.yml
kubectl -n grafana-agent create configmap loki-config --from-file loki.yml
kubectl -n grafana-agent create configmap mimir-config --from-file mimir.yml

kubectl -n grafana-agent create configmap json-dashboard-config --from-file grafana-dashboards/*

# grafana agent configs
kubectl -n grafana-agent create configmap entrypoint-config --from-file grafana-agent/entrypoint.sh
kubectl -n grafana-agent create configmap prometheus-custom-config --from-file grafana-agent/prometheus-custom.yml
kubectl -n grafana-agent create configmap prometheus-config --from-file grafana-agent/prometheus.yml
kubectl -n grafana-agent create configmap promtail-config --from-file grafana-agent/promtail.yml

kubectl -n grafana-agent apply -f main.yml
