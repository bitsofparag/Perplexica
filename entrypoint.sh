#!/bin/sh
# entrypoint.sh

# Replace placeholder in config.toml with the actual environment variables
sed -i "s|SEARXNG = \".*\"|SEARXNG = \"${SEARXNG_API_URL}\"|g" /home/perplexica/config.toml

# Execute the container's main command
exec "$@"
