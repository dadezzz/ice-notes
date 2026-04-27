FROM git.zarantonello.dev/infra/ci:v2.3.77@sha256:2b985d7a84d81aa4a2e0ef05c722c8bc9a38be64c130089075059bd17b7ae58a AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.2-alpine@sha256:834468128c7696cec0ceea6172f7d692daf645ae51983ca76e39da54a97c570d

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
