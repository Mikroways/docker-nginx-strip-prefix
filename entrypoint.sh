#!/usr/bin/env sh

set -eo pipefail

[ -z "$NGINX_REMOVE_PREFIX" ] && (echo "NGINX_REMOVE_PREFIX is not set" && exit 1)

sed "s@%base_url%@$API_URL@;s@%prices_web_socket_url%@$WEB_SOCKET_URL@" \
    /app/config.js.tpl > /app/config.js

exec "$@"
