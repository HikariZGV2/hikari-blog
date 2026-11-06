#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

HUGO_BIN="${HUGO_BIN:-/home/mori/.local/bin/hugo}"

if [ ! -x "$HUGO_BIN" ]; then
    echo "Hugo not found at $HUGO_BIN"
    echo "Install it first or set HUGO_BIN environment variable."
    exit 1
fi

case "${1:-server}" in
    server)
        echo ">> Starting Hugo dev server at http://localhost:1313"
        "$HUGO_BIN" server --buildDrafts --port 1313
        ;;
    build)
        echo ">> Building static site to public/"
        "$HUGO_BIN" --minify
        ;;
    new)
        shift
        if [ -z "$1" ]; then
            echo "Usage: $0 new <content-name>"
            exit 1
        fi
        "$HUGO_BIN" new content "$1"
        ;;
    *)
        echo "Usage: $0 {server|build|new <name>}"
        exit 1
        ;;
esac
