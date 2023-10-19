# Run grafana-agent in prometheus
This will allow you to run grafana, grafana-agent, prometheus, promtail and loki for metrics and logs collection in a kubernetes environment.

1. Grafana will act as visualization platform. View metrics and also logs explore. Runs on port `3000` by default.
    - Has a service that runs on port `30000`
2. Minio - will act as S3 storage for mimir metrics. Runs on port `9000` and `9001` by default. Creates bucket called `mimir` and user `myminio` password `mypassword`.
    - Has a service that runs on port `30001` and `30002`. You can login to minio UI on the browser using port 30002.
3. Mimir acts as a central receive server. Runs on port `8080` by default.
    - Has a service that runs on port `30003`
4. Loki as a central logging entity for logs. Runs on port `3100` by default.
    - Has a service that runs on port `30004`
4. Grafana agent
    - scrapes metrics and sends them to central metrics server (mimir).
    - Collects logs and send to loki server
    - Has node expoter to get node metrics
