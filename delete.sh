#!/bin/bash

kubectl -n grafana-agent delete -f main.yml
kubectl delete namespace grafana-agent
