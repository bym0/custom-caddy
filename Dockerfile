ARG TAG=2.9.1

FROM caddy:${TAG}-builder-alpine AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/hetzner

FROM caddy:${TAG}-alpine
RUN apk add curl
COPY --from=builder /usr/bin/caddy /usr/bin/caddy