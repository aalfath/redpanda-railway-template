# Changelog

Deployers read this before applying an update from Railway's "update available" notice.

## 2026-11-16: Deploy on Railway button

- README only: the Deploy on Railway button at the top now links to the published template `redpanda-1`. Nothing to apply for running deployments.

## 2026-11-16: Redpanda v26.2.7, Kafbat UI v1.5.0

- The template now builds both services from this repo (`redpanda/` and `kafbat/`) instead of running the images directly, so future version bumps reach deployers as Railway update notices.
- Redpanda `v26.2.3` → `v26.2.7` (`redpandadata/redpanda@sha256:43545ee0…`). Patch releases within 26.2, no data migration.
- Kafbat UI stays at `v1.5.0` (`ghcr.io/kafbat/kafka-ui@sha256:7cda86a3…`), now pinned by digest.
- The Redpanda service gets a health check (`/v1/status/ready` on the Admin API, port 9644), so a broker that fails to start no longer shows as a successful deploy.
- `AUTH_TYPE=LOGIN_FORM` is baked into the Kafbat image, so the console always needs a login.
