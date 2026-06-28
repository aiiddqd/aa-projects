ASTRO_DIR := astro

.PHONY: help dev dev-stop dev-status dev-logs build preview install

help:
	@echo "Available targets: dev, dev-stop, dev-status, dev-logs, build, preview, install"

dev:
	cd $(ASTRO_DIR) && npm exec astro -- dev --background

dev-stop:
	cd $(ASTRO_DIR) && npm exec astro -- dev stop

dev-status:
	cd $(ASTRO_DIR) && npm exec astro -- dev status

dev-logs:
	cd $(ASTRO_DIR) && npm exec astro -- dev logs

build:
	cd $(ASTRO_DIR) && npm run build

preview:
	cd $(ASTRO_DIR) && npm run preview

install:
	cd $(ASTRO_DIR) && npm install