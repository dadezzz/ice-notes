FROM git.zarantonello.dev/infra/ci:v2.4.1@sha256:f3b1dc308ab2dcd64bcba49772828516672e0a0179066428f5f6fb9ffc15d775 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.3-alpine@sha256:bb56e6200ec26a67f04be90255993dc390c9815967f67f24b4ca6466e88de64b

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
