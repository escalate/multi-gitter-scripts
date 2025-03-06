SHELL = /bin/bash
.SHELLFLAGS = -e -o pipefail -c

MULTI_GITTER_ARGS ?= $(MULTI_GITTER_OPTIONS)

.PHONY: dependencies
dependencies:
	test -n "$(GITHUB_TOKEN)" # check env variable $$GITHUB_TOKEN
	test -n "$(GITHUB_USER)" # check env variable $$GITHUB_USER

.PHONY: print
print: dependencies
	test -n "$(MULTI_GITTER_SCRIPT)" # check env variable $$MULTI_GITTER_SCRIPT
	multi-gitter print "$(MULTI_GITTER_SCRIPT)" \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)"

.PHONY: dry-run
dry-run: dependencies
	test -n "$(MULTI_GITTER_SCRIPT)" # check env variable $$MULTI_GITTER_SCRIPT
	test -n "$(MULTI_GITTER_BRANCH)" # check env variable $$MULTI_GITTER_BRANCH
	test -n "$(MULTI_GITTER_COMMIT_MSG)" # check env variable $$MULTI_GITTER_COMMIT_MSG
	test -n "$(MULTI_GITTER_COMMIT_AUTHOR_NAME)" # check env variable $$MULTI_GITTER_COMMIT_AUTHOR_NAME
	test -n "$(MULTI_GITTER_COMMIT_AUTHOR_EMAIL)" # check env variable $$MULTI_GITTER_COMMIT_AUTHOR_EMAIL
	multi-gitter run "$(MULTI_GITTER_SCRIPT)" \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)" \
		--branch="$(MULTI_GITTER_BRANCH)" \
		--commit-message="$(MULTI_GITTER_COMMIT_MSG)" \
		--author-name="$(MULTI_GITTER_COMMIT_AUTHOR_NAME)" \
		--author-email="$(MULTI_GITTER_COMMIT_AUTHOR_EMAIL)" \
		--conflict-strategy="replace" \
		--dry-run

.PHONY: run
run: dependencies
	test -n "$(MULTI_GITTER_SCRIPT)" # check env variable $$MULTI_GITTER_SCRIPT
	test -n "$(MULTI_GITTER_BRANCH)" # check env variable $$MULTI_GITTER_BRANCH
	test -n "$(MULTI_GITTER_COMMIT_MSG)" # check env variable $$MULTI_GITTER_COMMIT_MSG
	test -n "$(MULTI_GITTER_COMMIT_AUTHOR_NAME)" # check env variable $$MULTI_GITTER_COMMIT_AUTHOR_NAME
	test -n "$(MULTI_GITTER_COMMIT_AUTHOR_EMAIL)" # check env variable $$MULTI_GITTER_COMMIT_AUTHOR_EMAIL
	multi-gitter run "$(MULTI_GITTER_SCRIPT)" \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)" \
		--branch="$(MULTI_GITTER_BRANCH)" \
		--commit-message="$(MULTI_GITTER_COMMIT_MSG)" \
		--author-name="$(MULTI_GITTER_COMMIT_AUTHOR_NAME)" \
		--author-email="$(MULTI_GITTER_COMMIT_AUTHOR_EMAIL)" \
		--conflict-strategy="replace"

.PHONY: merge
merge: dependencies
	test -n "$(MULTI_GITTER_BRANCH)" # check env variable $$MULTI_GITTER_BRANCH
	multi-gitter merge \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)" \
		--branch="$(MULTI_GITTER_BRANCH)"

.PHONY: status
status: dependencies
	test -n "$(MULTI_GITTER_BRANCH)" # check env variable $$MULTI_GITTER_BRANCH
	multi-gitter status \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)" \
		--branch="$(MULTI_GITTER_BRANCH)"

.PHONY: close
close: dependencies
	test -n "$(MULTI_GITTER_BRANCH)" # check env variable $$MULTI_GITTER_BRANCH
	multi-gitter close \
		$(MULTI_GITTER_ARGS) \
		--platform="github" \
		--token="$(GITHUB_TOKEN)" \
		--log-file="multi-gitter-$(shell echo $$RANDOM).log" \
		--log-format="text" \
		--plain-output \
		--user="$(GITHUB_USER)" \
		--branch="$(MULTI_GITTER_BRANCH)"

.PHONY: clean
clean:
	rm --force multi-gitter-*.log
