[![Test](https://github.com/escalate/multi-gitter-scripts/actions/workflows/test.yml/badge.svg?branch=master&event=push)](https://github.com/escalate/multi-gitter-scripts/actions/workflows/test.yml)

# multi-gitter Scripts

Central management of my git repositories via [multi-gitter](https://github.com/lindell/multi-gitter) scripts.

## How to run a job

```
export GITHUB_TOKEN="REDACTED"
export GITHUB_USER="escalate"
export MULTI_GITTER_SCRIPT="jobs/code-of-conduct/code-of-conduct.sh"
export MULTI_GITTER_BRANCH="code-of-conduct"
export MULTI_GITTER_COMMIT_MSG="docs: add code of conduct"
export MULTI_GITTER_COMMIT_AUTHOR_NAME="Felix Boerner"
export MULTI_GITTER_COMMIT_AUTHOR_EMAIL="REDACTED"

make dry-run

make run

make status
```

## License

MIT
