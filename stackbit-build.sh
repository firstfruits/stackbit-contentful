#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db32589ed2a14001541a9b8/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db32589ed2a14001541a9b8
curl -s -X POST https://api.stackbit.com/project/5db32589ed2a14001541a9b8/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db32589ed2a14001541a9b8/webhook/build/publish > /dev/null
