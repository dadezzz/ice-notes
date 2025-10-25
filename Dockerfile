FROM git.zarantonello.dev/infra/ci:v1.1.8@sha256:f1fe69b7681b2a0da89ea4cab8c8b47f5729c25c9e763f897806eaf25b06aad3 AS builder

WORKDIR /srv

COPY package.json bun.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.bun/install/cache bun install -p

COPY . ./
RUN bun run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
