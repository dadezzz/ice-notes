FROM git.zarantonello.dev/infra/ci:v2.3.68@sha256:0db9d988c587a2dc312206f601d331f89d1b98a8c4711dd002b5cb322e7b2ece AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.2-alpine@sha256:24d58e24e4231c6667677a39469a3d843a3222eadbf640f22933f24bed0939ec

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
