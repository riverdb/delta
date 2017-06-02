#!/usr/bin/env bash

set -e
touch /tmp/coverage.txt

for d in $(go list ./... | grep -v vendor); do
    go test -race -coverprofile=/tmp/profile.out -covermode=atomic $d
    if [ -f /tmp/profile.out ]; then
        cat /tmp/profile.out >> /tmp/coverage.txt
        rm /tmp/profile.out
    fi
done
