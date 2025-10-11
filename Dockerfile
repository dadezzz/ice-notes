FROM git.zarantonello.dev/infra/ci:v1.0.11@sha256:0392925655dce34e979ff5e03f5dc12ec9bfb155ef048ca17fe0f36a754378de AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:7d75b1294f73048155757377c38f05621a65c8df4f261077aa3091c9168ea53a

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
