#!/usr/bin/dumb-init /bin/bash

echo "[info] Attempting to start singbox..."

sb_cli="nohup /usr/bin/sing-box -c /etc/sing-box.json"


if [[ -n "${SOCKS_PASS}" ]]; then
    sed "s/REPLACE_WITH_ACTUAL_PASS/${SOCKS_PASS}/g" /etc/sing-box-template.json > /etc/sing-box.json
fi

${sb_cli} &

echo "[info] singbox process started"
