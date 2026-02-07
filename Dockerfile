FROM git.zarantonello.dev/infra/ci:v2.3.22@sha256:a8093dfa3fde06d056300874eeb164f55f666978aa89c63ca8ed5654e2a37bdd AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:7f4c19ed8c32f961644681823de1a2fe5b74c84a45d0f3995286010c84b6c554

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
