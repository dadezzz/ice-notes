FROM git.zarantonello.dev/infra/ci:v2.3.12@sha256:243783f21fa24487c6db0d94769f71a744d2de967683a41df26169ea1fd3a9f4 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.10.2-alpine@sha256:11aadc735925d782bdc5d83344408a9d630ba00cf45e68108e671011bc7386bc

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
