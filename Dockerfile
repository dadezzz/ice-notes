FROM git.zarantonello.dev/infra/ci:v2.3.37@sha256:df8adedea3f7749f273918aff72021b1b635635b05a6575068e77968e6d1276b AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.1-alpine@sha256:3b2a0196e0687279c14c27adff9fc6b44acfa318dbb97eaebe385bdf99e5364c

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
