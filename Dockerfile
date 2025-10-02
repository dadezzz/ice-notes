FROM git.zarantonello.dev/infra/ci:v1.0.6@sha256:31e11c2e307e110dcf8063a5820b6d456d7a2247dedf2031442788ccc7ec3ae0 AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
