#!/bin/sh
caddy reverse-proxy --from :8096 --to jellyfin:8096
