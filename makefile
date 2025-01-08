# Targets
.PHONY: help start stop clean

SHELL := /bin/bash

help:
	@echo "Usage: make <target>"
	@echo ""
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$|(^#--)' $(MAKEFILE_LIST) \
	| grep -v '^\(include\|[A-Z_]\+\s*=\)' \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m %-43s\033[0m %s\n", $$1, $$2}' \
	| sed -e 's/\[32m #-- /[33m/'

#-- Docker
start: ## Start the docusaurus services
	@echo "Starting docusaurus services..."
	docker compose up -d

stop: ## Stop the docusaurus services
	@echo "Stopping docusaurus services..."
	docker compose stop

clean: ## Remove all Docker containers, networks, and volumes
	@echo "Cleaning up docusaurus resources..."
	docker compose down -v --remove-orphans

#-- Utilities
open: ## Open the Docusaurus site in the default web browser
	@echo "Opening Docusaurus site..."
	xdg-open http://localhost:3000 2>/dev/null || \
	open http://localhost:3000 2>/dev/null || \
	start http://localhost:3000
