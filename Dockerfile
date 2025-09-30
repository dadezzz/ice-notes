FROM git.zarantonello.dev/infra/ci:v1.0.3@sha256:9ed3f42a064f7b4f867c4ab49c8559f7f1942f4219a7d38db302344bf886ba29 AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
