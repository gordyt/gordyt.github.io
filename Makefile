SOURCE_BRANCH = source
BUILD_DIR = source/hugo-site/public

.PHONY: publish clean distclean

publish: distclean
	@echo "📦 Fetching build artifacts from $(SOURCE_BRANCH)…"
	git archive $(SOURCE_BRANCH) --prefix=/ $(BUILD_DIR) | tar -x -C .
	@echo "✅ Artifacts extracted."
	@git add .
	@git commit -m "Publish site update from $(SOURCE_BRANCH)" || echo "📝 Nothing to commit."
	@git push origin master
	@echo "🚀 Published to GitHub Pages!"

clean:
	@echo "🧹 Cleaning uncommitted files…"
	git reset --hard
	git clean -fdx
	@echo "✅ Clean."

distclean:
	@echo "🧨 Removing all tracked files except Makefile and .gitignore…"
	git ls-files | grep -vE '^Makefile$|^.gitignore$$' | xargs git rm -f
	git clean -fdx
	@echo "✅ Clean slate ready for new build."
