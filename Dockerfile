FROM git.zarantonello.dev/infra/ci:v2.3.16@sha256:b4c91d2e15faf2e2d47d68b5577dd991167dd915b46fe6ffe1358dda7e74fe2f AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:f2b257f20955d6be2229bed86bad24193eeb8c4dc962a4031a6eb42344ffa457

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
