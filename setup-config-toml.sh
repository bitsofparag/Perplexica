#!/bin/sh

if [ -n "${CONFIG_TOML_BASE64}" ]; then
    echo "${CONFIG_TOML_BASE64}" | base64 -d > config.toml
    echo "Decoded CONFIG_TOML_BASE64 to config.toml"
else
    echo "CONFIG_TOML_BASE64 is not set, using existing config.toml"
fi
