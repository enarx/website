#!/usr/bin/env bash

readonly ORG="${ORG:-enarx}"

get_latest_release() {
    curl --silent https://api.github.com/repos/$1/releases | jq 'first | .tag_name' | tr -d \"
}

orig_dir="$(pwd)"
release=$(get_latest_release "${ORG}/enarx")

echo "ORG: ${ORG}"
echo "RELEASE: ${release}"

(test -d versioned && echo "Deleting old versioned directory" && rm -rf versioned)
git clone  --branch ${release} https://github.com/${ORG}/enarx.git versioned

(test -d versioned/docs/ && rsync -avp --ignore-times versioned/docs/* versioned_staging) || echo versioned docs do not exist, skipping step
(test -d versioned_staging && rsync -avp --ignore-times versioned_staging/* docs/) || echo versioned docs do not exist, skipping step

yarn install
yarn lint
yarn build
