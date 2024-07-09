BUILD_COMMIT=$(shell git rev-parse --short HEAD 2>/dev/null)
IMAGE_DATE=$(shell date -u +%Y-%m-%d.%H%M%S)
IMAGE_SERVER_NAME=$(shell basename $(PWD) | tr '[:upper:]' '[:lower:]')
IMAGE_TAG := $(IMAGE_DATE)-$(BUILD_COMMIT)

clean:
	@if [ -d build ]; then \
		rm -r build; \
		echo "\033[0;32mDelete build directory successfully!\033[0m"; \
	else \
		echo "\033[0;33mNothing build directory to clean!\033[0m"; \
	fi

build:
	yarn build

image-test: clean build
	docker build --platform=linux/amd64 -t registry.druid.company/druidgo/web/$(IMAGE_SERVER_NAME):$(IMAGE_TAG) .
	docker push registry.druid.company/druidgo/web/$(IMAGE_SERVER_NAME):$(IMAGE_TAG)