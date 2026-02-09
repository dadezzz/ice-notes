FROM git.zarantonello.dev/infra/ci:v2.3.24@sha256:ded54f61957ab0a7ea98cc914e62cfd1f2669c8d4ed76da3ac44a59529d6b685 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:7f4c19ed8c32f961644681823de1a2fe5b74c84a45d0f3995286010c84b6c554

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
