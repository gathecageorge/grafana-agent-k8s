#!/bin/bash

WORK_DIR=$(dirname "$(readlink -f "${BASH_SOURCE}")")
SERVER_LABEL_HOSTNAME="$1"

# -----------------------------------------------------------------------------------------------------
# Start fresh every time
cat > "$WORK_DIR/grafana-agent-config.yml" << EOF
server:
  log_level: info

integrations:
  node_exporter:
    enabled: true

metrics:
  configs:
    - name: default
EOF

# -----------------------------------------------------------------------------------------------------
# Set metrics section
sed -e 's/^/      /' "$WORK_DIR/grafana-agent-prometheus.yml" >> "$WORK_DIR/grafana-agent-config.yml"
sed -e 's/^/  /' "$WORK_DIR/grafana-agent-prometheus-custom.yml" >> "$WORK_DIR/grafana-agent-config.yml"

# -----------------------------------------------------------------------------------------------------
# Set logs section
echo >> "$WORK_DIR/grafana-agent-config.yml"
sed -e 's/^//' "$WORK_DIR/grafana-agent-promtail.yml" >> "$WORK_DIR/grafana-agent-config.yml"

# -----------------------------------------------------------------------------------------------------
sed -i "s/SERVER_LABEL_HOSTNAME/$SERVER_LABEL_HOSTNAME/" "$WORK_DIR/grafana-agent-config.yml"
exec /usr/bin/grafana-agent --config.file=$WORK_DIR/grafana-agent-config.yml --metrics.wal-directory=/etc/agent/data
