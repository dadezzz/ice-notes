FROM git.zarantonello.dev/infra/ci:v1.0.8@sha256:b67f727662fc1f896e564b8f43e1c06465a298fbe0510945fa7348a56d3b9ffc AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
