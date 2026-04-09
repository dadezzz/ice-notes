FROM git.zarantonello.dev/infra/ci:v2.3.64@sha256:39d29d59cd59e7890b8acdd49ee31c8508d272fdca9d6f6e480dd0c83a4a25ad AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.2-alpine@sha256:fce4f15aad23222c0ac78a1220adf63bae7b94355d5ea28eee53910624acedfa

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
