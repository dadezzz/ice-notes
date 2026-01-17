FROM git.zarantonello.dev/infra/ci:v2.3.9@sha256:694151b154dc3e0e35b678b9c894703a91567d729e4085a0d733c0f066b529d5 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:11aadc735925d782bdc5d83344408a9d630ba00cf45e68108e671011bc7386bc

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
