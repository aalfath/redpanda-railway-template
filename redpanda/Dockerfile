# Redpanda single-node broker for Railway.
# Pinned by version and digest; bump both together (see CHANGELOG.md).
FROM redpandadata/redpanda:v26.2.7@sha256:43545ee03966431f5451e0b3c1e651b39fbe3eb383360220311021f50133b649

# Railway volumes are owned by root, so the broker runs as root to write
# /var/lib/redpanda/data (the image's default user is "redpanda").
USER root
COPY --chmod=755 start.sh /usr/local/bin/railway-redpanda-start
ENTRYPOINT ["/usr/local/bin/railway-redpanda-start"]
