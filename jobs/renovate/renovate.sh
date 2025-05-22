#!/bin/bash
set -e -E -u -C -o pipefail

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Git repository: ${REPOSITORY}"

echo "${REPOSITORY} - Override renovate.json"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/renovate/recommended-renovate.json" --output renovate.json

echo "${REPOSITORY} - Remove dependabot.yml"
rm ".github/dependabot.yml"
