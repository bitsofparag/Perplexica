#!/bin/sh

if [ -f /home/perplexica/config.toml ]; then
    sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /home/perplexica/config.toml
    echo "Modified config.toml with SEARXNG_API_URL"
else
    echo "config.toml not found"
    exit 1
fi

exec "$@"
