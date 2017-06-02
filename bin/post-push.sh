#!/usr/bin/env bash

if [ -n "${IGNORE_POST_PUSH_HOOK}" ]; then
        exit 0
fi

set -e

if [ -f coverage.txt ] then
	bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"
fi
