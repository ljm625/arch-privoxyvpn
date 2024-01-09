#!/usr/bin/dumb-init /bin/bash

echo "[info] Attempting to start gost..."

gost_cli_tcp="nohup /usr/bin/gost"
gost_cli_udp="nohup /usr/bin/gost"


if [[ -n "${SOCKS_PASS}" ]]; then
	gost_cli_tcp="${gost_cli_tcp}  -L=ss2://AEAD_CHACHA20_POLY1305:${SOCKS_PASS}@:9119"
	gost_cli_udp="${gost_cli_udp}  -L=ssu://AEAD_CHACHA20_POLY1305:${SOCKS_PASS}@:9119"
fi

${gost_cli_tcp} &
${gost_cli_udp} &

echo "[info] gost process started"
