.DEFAULT_GOAL := help

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

pull-original: ## Pulls the latest challenges from the original Tidy Tuesday repository.
	# from https://stackoverflow.com/a/40922278
	git remote add upstream https://github.com/rfordatascience/tidytuesday

	# from https://gist.github.com/subhodi/89619d575ac35a7a4e78f6a7ac705f7e 
	git fetch upstream
	git checkout master
	git merge upstream/master
	git push origin master
