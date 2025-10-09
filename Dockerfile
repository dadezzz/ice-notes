FROM git.zarantonello.dev/infra/ci:v1.0.10@sha256:b7cfa5acc946617dae45d3b2a2bec3be8cbf9738f3bdd61705276302daa6340b AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:7d75b1294f73048155757377c38f05621a65c8df4f261077aa3091c9168ea53a

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
