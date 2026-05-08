.PHONY: help clean serve
.DEFAULT_GOAL := help
SHELL := /bin/bash
.ONESHELL:

-include dot.env
export

##@ Helpers

help:                                           ## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

##@ Main

clean:                                          ## remove astro-generated files (preserves CNAME, README, Makefile, .gitignore)
	rm -rf assets _astro index.html 404.html hashmap.json sitemap-*.xml *.svg

serve:                                          ## serve project on port 9000
	python3 -m http.server 9000
