#!/usr/bin/env bash

set -e

BADFMT=$(find . -type f -name '*.go' ! -path '*/vendor/*' | xargs gofmt -l)
if [ -n "$BADFMT" ]; then
    BADFMT=`echo "$BADFMT" | sed "s/^/  /"`
    echo -e "go fmt is sad:\n\n$BADFMT"
    exit 1
fi
