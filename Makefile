DOCKER_REVISION ?= thelounge-testing-$(USER)
DOCKER_TAG = docker-push.ocf.berkeley.edu/thelounge:$(DOCKER_REVISION)

# This is taken from ocfweb, the + 3 is so that it doesn't collide with other
# running services using this scheme like ocfweb, metabase, etc.
RANDOM_PORT := $(shell expr $$(( 8000 + (`id -u` % 1000) + 3 )))

.PHONY: dev
dev: cook-image
	docker run --rm -p $(RANDOM_PORT):9000 \
		-ti $(DOCKER_TAG)

.PHONY: cook-image
cook-image:
	docker build --pull \
		-t $(DOCKER_TAG) .

.PHONY: push-image
push-image:
	docker push $(DOCKER_TAG)