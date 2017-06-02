#!/usr/bin/env bash

set -e
echo "" > coverage.txt

for d in $(go list ./... | grep -v vendor); do
    go test -race -coverprofile=/tmp/profile.out -covermode=atomic $d
    if [ -f /tmp/profile.out ]; then
        cat /tmp/profile.out >> coverage.txt
        rm /tmp/profile.out
    fi
done

bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"
