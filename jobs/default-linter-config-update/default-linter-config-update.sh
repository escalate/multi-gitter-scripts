#!/bin/bash
set -e -E -u -C -o pipefail

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Git repository: ${REPOSITORY}"

echo "${REPOSITORY} - Override .editorconfig"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/default-linter-config-update/.editorconfig" --output .editorconfig

echo "${REPOSITORY} - Override .prettierignore"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/default-linter-config-update/.prettierignore" --output .prettierignore

echo "${REPOSITORY} - Override .yamllint"
curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/default-linter-config-update/.yamllint" --output .yamllint

if [[ -f ".flake8" ]]; then
  echo "${REPOSITORY} - Override .flake8"
  curl --silent --show-error --fail-with-body "https://raw.githubusercontent.com/escalate/multi-gitter-scripts/refs/heads/master/jobs/default-linter-config-update/.flake8" --output .flake8
fi
