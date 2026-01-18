FROM git.zarantonello.dev/infra/ci:v2.3.10@sha256:ef0ef90054d6fc1447f935fc5a8f8aedbbad0e3c34ed04727f058c8311b0c2d3 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:11aadc735925d782bdc5d83344408a9d630ba00cf45e68108e671011bc7386bc

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
