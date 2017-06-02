#!/usr/bin/env bash

TARGET_HOOK="$(git rev-parse --show-toplevel)/.git/hooks/post-push"

if [ ! -L "${TARGET_HOOK}" ]; then
  echo "${TARGET_HOOK}" missing
  pushd "$(git rev-parse --show-toplevel)"
  ln -s ../../bin/post-push.sh .git/hooks/post-push
  popd
else
  echo "hook already installed"
fi
