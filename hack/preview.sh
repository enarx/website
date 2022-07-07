#!/usr/bin/env bash

readonly ORG="${ORG:-enarx}"
readonly REF="${REF:-main}"

echo "ORG: ${ORG}"
echo "REF: ${REF}"
(test -d versioned && echo "Deleting old versioned directory" && rm -rf versioned)
git clone --branch ${REF} https://github.com/${ORG}/enarx.git versioned

(test -d versioned/docs/ && rsync -avp --no-links --ignore-times versioned/docs/* versioned_staging) || echo versioned docs do not exist, skipping step
if [ ! -d versioned_staging/Running ];then mkdir versioned_staging/Running; fi
(test -d versioned/crates/enarx-config/ && cp versioned/crates/enarx-config/Enarx_toml.md versioned_staging/Running/Enarx_toml.md) || echo enarx_config versioned docs do not exist, skipping step
(test -d versioned_staging && rsync -avp --no-links --ignore-times versioned_staging/* docs/) || echo versioned docs do not exist, skipping step
(test -d override && rsync -avp --no-links --ignore-times override/* docs/) || echo override docs do not exist, skipping step

yarn install
yarn lint
docusaurus build || npm run docusaurus build
