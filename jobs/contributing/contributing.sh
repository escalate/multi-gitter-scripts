#!/bin/bash
set -e -E -u -C -o pipefail

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Git repository: ${REPOSITORY}"

echo "${REPOSITORY} - Override CONTRIBUTING.md"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/contributing/CONTRIBUTING.md" --output CONTRIBUTING.md
envsubst < CONTRIBUTING.md > CONTRIBUTING.md.tmp
mv CONTRIBUTING.md.tmp CONTRIBUTING.md
