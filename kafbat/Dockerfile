# Kafbat UI (web console for Kafka / Redpanda) for Railway.
# Pinned by version and digest; bump both together (see CHANGELOG.md).
FROM ghcr.io/kafbat/kafka-ui:v1.5.0@sha256:7cda86a33344160309fdb65146332e4da65db81a945614f2fe32e210803f6fd1

# Safe defaults baked in, so the console never comes up without a login
# even if a deployer deletes the template variables.
ENV AUTH_TYPE=LOGIN_FORM \
    DYNAMIC_CONFIG_ENABLED=false \
    SERVER_PORT=8080
