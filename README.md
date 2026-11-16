# Redpanda on Railway

One-click Railway template for [Redpanda](https://github.com/redpanda-data/redpanda), a Kafka-compatible streaming platform, with [Kafbat UI](https://github.com/kafbat/kafka-ui) as a password-protected web console.

## What it deploys

| Service | Built from | Version | Networking | Storage |
| --- | --- | --- | --- | --- |
| `redpanda` | `redpanda/Dockerfile` | `redpandadata/redpanda:v26.2.7` (pinned by digest) | private only: Kafka 9092, Schema Registry 8081, HTTP Proxy 8082, Admin 9644 | volume at `/var/lib/redpanda/data` |
| `kafbat` | `kafbat/Dockerfile` | `ghcr.io/kafbat/kafka-ui:v1.5.0` (pinned by digest) | public Railway domain on 8080 | none |

Redpanda runs as one broker in `dev-container` mode (one core, `REDPANDA_MEMORY`, default `1G`). It advertises its private hostname, so clients in the same Railway project use `redpanda.railway.internal:9092`. The broker has no authentication and is not exposed to the internet.

## Variables

| Service | Variable | Default | Purpose |
| --- | --- | --- | --- |
| redpanda | `REDPANDA_MEMORY` | `1G` | Memory given to the broker |
| redpanda | `PORT` | `9644` | Admin API port, used by Railway's health check |
| redpanda | `RAILWAY_RUN_UID` | `0` | Run as root so the volume is writable |
| kafbat | `SPRING_SECURITY_USER_NAME` | `admin` | Console login |
| kafbat | `SPRING_SECURITY_USER_PASSWORD` | generated | Console password (see the service's Variables tab) |
| kafbat | `KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS` | `${{redpanda.RAILWAY_PRIVATE_DOMAIN}}:9092` | Broker address |
| kafbat | `KAFKA_CLUSTERS_0_SCHEMAREGISTRY` | `http://${{redpanda.RAILWAY_PRIVATE_DOMAIN}}:8081` | Schema Registry address |

## Updates

Both services build from this repo's `main` branch. When a new Redpanda or Kafbat version is pinned here and merged to `main`, Railway shows deployers an "update available" notice; they choose when to apply it. Read [CHANGELOG.md](CHANGELOG.md) first.

This is a community-maintained deployment package and does not imply affiliation with or endorsement by Redpanda Data or the Kafbat project. Redpanda Community is licensed under the BSL 1.1.
