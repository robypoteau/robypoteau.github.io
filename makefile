.PHONY: help
help:
	@echo "Usage:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-15s\033[0m %s\n", $$1, $$2}'


test: ## Set up a test server.
	docker run --rm -it \
	--volume="$(PWD):/srv/jekyll" \
	--volume="$(PWD)/vendor/bundle:/usr/local/bundle" \
	-p 4000:4000 jekyll/jekyll:latest \
	jekyll serve --force-polling --watch