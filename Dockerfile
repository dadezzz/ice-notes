FROM git.zarantonello.dev/infra/ci:v2.3.33@sha256:5796fed06886106443c311d87c15b4c100f682b9c1dafb9ddf331375f478a3d9 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.1-alpine@sha256:7f5a0f0468688c5305f1caf56302efb3d2512668b73d4d4eb2202ad53ae95b66

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
