.DEFAULT_GOAL := help

.PHONY: help
help: ## View help information
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: convert
convert: ## Convert TEX file to PDF
	pdflatex resume.tex

.PHONY: clean
clean: ## Clean build artifacts
	rm resume.log
	rm resume.aux

.PHONY: build
build: convert clean ## Build PDF

