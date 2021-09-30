#!/bin/bash
set -e
trap 'catch $? $LINENO' ERR
catch() {
  echo "Error $1 occurred on $2"
}
set -euo pipefail

SCRIPT_PATH=$0
REAL_SCRIPT_PATH=$(readlink -f ${SCRIPT_PATH})
SCRIPT_DIR=$(dirname ${REAL_SCRIPT_PATH}})
WORKSPACE_DIR=$(cd "${SCRIPT_DIR}"/.. && pwd)
TEST_DIR="${WORKSPACE_DIR}"/src/test/javascript/sdet-assignment-service-codeceptsjs

ORIG_DIR=$(pwd)

echo '** installing project deps! **'
# TODO