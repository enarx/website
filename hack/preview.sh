#!/usr/bin/env bash

readonly ORG="${ORG:-enarx}"
readonly REF="${REF:-main}"

echo "ORG: ${ORG}"
echo "REF: ${REF}"
(test -d versioned && echo "Deleting old versioned directory" && rm -rf versioned)
git clone --branch ${REF} https://github.com/${ORG}/enarx.git versioned

(test -d versioned/docs/ && rsync -avp --ignore-times versioned/docs/* versioned_staging) || echo versioned docs do not exist, skipping step
(test -d versioned_staging && rsync -avp --ignore-times versioned_staging/* docs/) || echo versioned docs do not exist, skipping step

yarn install
yarn lint
yarn build
