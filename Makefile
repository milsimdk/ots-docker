# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

up: ## Start OpenTAKServer
	docker compose up -d

stop: ## Stop OpenTAKServer
	docker compose stop

down: ## Take down OpenTAKServer
	docker compose down

restart: ## Restart OpenTAKServer
	docker compose restart opentakserver

logs: ## Logs for OpenTAKServer
	docker compose logs -f --tail=100

push:
	git add .
	git commit -m'Work-in-progress'
	git push

dev-clean:
	@find ./persistent/ots/ ! -name ".gitignore" -delete;
