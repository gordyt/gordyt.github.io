SOURCE_BRANCH = source
BUILD_DIR = source/hugo-site/public

.PHONY: publish

publish: clean
	@echo "📦 Fetching build artifacts from $(SOURCE_BRANCH)…"
	git archive $(SOURCE_BRANCH) --prefix=/ $(BUILD_DIR) | tar -x -C .
	mv source/hugo-site/public/* .
	git commit -a 'publish'

clean:
	for f in $$(ls | grep -E -v 'Makefile|gitignore'); do rm -rf $$f; done
