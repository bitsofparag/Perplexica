#!/bin/sh

if [ -n "${CONFIG_TOML_BASE64}" ]; then
    echo "${CONFIG_TOML_BASE64}" | base64 -d > /home/perplexica/config.toml
    echo "Decoded CONFIG_TOML_BASE64 to /home/perplexica/config.toml"
else
    echo "CONFIG_TOML_BASE64 is not set, using existing config.toml"
fi

if [ -f /home/perplexica/config.toml ]; then
    sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /home/perplexica/config.toml
    echo "Modified config.toml with SEARXNG_API_URL"
else
    echo "config.toml not found"
    exit 1
fi

exec "$@"
