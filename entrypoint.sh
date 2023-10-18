#!/bin/bash

# WORK_DIR="$(pwd)"
WORK_DIR="/configs"
SERVER_LABEL_HOSTNAME="$1"

# -----------------------------------------------------------------------------------------------------
# Start fresh every time
cat > "$WORK_DIR/agent.yml" << EOF
server:
  log_level: info

metrics:
  configs:
    - name: default
EOF

# -----------------------------------------------------------------------------------------------------
# Set metrics section
sed -e 's/^/      /' "$WORK_DIR/prometheus.yml" >> "$WORK_DIR/agent.yml"

# -----------------------------------------------------------------------------------------------------
# Set logs section
echo >> "$WORK_DIR/agent.yml"
sed -e 's/^//' "$WORK_DIR/promtail.yml" >> "$WORK_DIR/agent.yml"

# -----------------------------------------------------------------------------------------------------
sed -i "s/SERVER_LABEL_HOSTNAME/$SERVER_LABEL_HOSTNAME/" "$WORK_DIR/agent.yml"
exec /usr/bin/grafana-agent --config.file=$WORK_DIR/agent.yml --metrics.wal-directory=/etc/agent/data
