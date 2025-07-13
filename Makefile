SOURCE_BRANCH = source
BUILD_DIR = source/hugo-site/public

.PHONY: clean publish

publish: clean
	@echo "📦 Fetching build artifacts from $(SOURCE_BRANCH)…"
	git archive $(SOURCE_BRANCH) --prefix=/ $(BUILD_DIR) | tar -x -C .
	mv source/hugo-site/public/* .
	rm -rf source
	git add .
	git commit -m 'publish' || echo "📝 Nothing to commit."

clean:
	for f in $$(ls | grep -E -v 'Makefile|gitignore'); do git rm -rf $$f; done
