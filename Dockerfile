FROM git.zarantonello.dev/infra/ci:v1.0.8@sha256:b67f727662fc1f896e564b8f43e1c06465a298fbe0510945fa7348a56d3b9ffc AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:c94c06446b916bf8153f5128825acf7747205ecf815b3bacd27027ef5ad2f13a

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
