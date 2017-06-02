#!/usr/bin/env bash

set -e

git push "$@"

if [ -n "${IGNORE_POST_PUSH_HOOK}" ]; then
        exit 0
fi

if [ -f coverage.txt ]; then
	bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"
fi

