# hadolint ignore=DL3007
FROM git.zarantonello.dev/infra/ci:latest@sha256:f0060036e948e91050ef5ad4ce5654c7433b46a7d9161fa511678b10c5c550a2 AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
