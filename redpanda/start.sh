#!/bin/sh
# Start a single Redpanda broker on Railway's private network.
# Kafka API 9092, Schema Registry 8081, HTTP Proxy 8082 and RPC 33145 listen
# on IPv4 and IPv6 and advertise the service's private hostname.
# The Admin API stays on its default 0.0.0.0:9644; Railway's health check
# probes /v1/status/ready there.
set -e
MEMORY="${REDPANDA_MEMORY:-1G}"
HOST="${RAILWAY_PRIVATE_DOMAIN:-localhost}"

exec /usr/bin/rpk redpanda start \
  --mode dev-container \
  --smp 1 \
  --memory "$MEMORY" \
  --overprovisioned \
  --node-id 0 \
  --kafka-addr "internal://[::]:9092" \
  --advertise-kafka-addr "internal://${HOST}:9092" \
  --rpc-addr "[::]:33145" \
  --advertise-rpc-addr "${HOST}:33145" \
  --schema-registry-addr "[::]:8081" \
  --pandaproxy-addr "[::]:8082" \
  --advertise-pandaproxy-addr "${HOST}:8082" \
  "$@"
