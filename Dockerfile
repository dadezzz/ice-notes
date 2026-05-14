FROM git.zarantonello.dev/infra/ci:v2.4.2@sha256:dfb641e445d61b9934d624f7ca5549393efb9bcd3aa3bc18bf9976f0cea8b090 AS builder

WORKDIR /srv

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN --mount=type=cache,sharing=locked,target=/root/.local/share/pnpm/store pnpm install -p

COPY . ./
RUN pnpm run build

FROM docker.io/library/caddy:2.11.3-alpine@sha256:bb56e6200ec26a67f04be90255993dc390c9815967f67f24b4ca6466e88de64b

COPY --from=builder /srv/dist /srv

ENTRYPOINT ["caddy", "file-server", "--root=/srv"]
