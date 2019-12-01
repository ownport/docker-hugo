HUGO_VERSION=0.60.1

build-docker-image:
	docker build -t ownport/hugo:${HUGO_VERSION} .

run-hugo-server-console:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:${HUGO_VERSION} \
		/bin/sh

run-hugo-create-new-site:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:${HUGO_VERSION} \
		hugo:newsite .

run-hugo-server:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:${HUGO_VERSION} \
		hugo:server
