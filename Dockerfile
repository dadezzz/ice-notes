FROM git.zarantonello.dev/infra/ci:v2.3.18@sha256:37ecffd8c45d9ebb5094c286f7d9daa1022553977bcb1e5d4590c6b53b73a442 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:d266901f6e0c9d74528463654b7e872e6af8f6bbe23ca13576a1fb601202f8da

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
