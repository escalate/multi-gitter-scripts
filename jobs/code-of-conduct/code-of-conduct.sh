#!/bin/bash
set -e -E -u -C -o pipefail

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Git repository: ${REPOSITORY}"

echo "${REPOSITORY} - Override CODE_OF_CONDUCT.md"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/code-of-conduct/CODE_OF_CONDUCT.md" --output CODE_OF_CONDUCT.md
