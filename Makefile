build-docker-image:
	docker build -t ownport/hugo:0.32 .

run-hugo-server-console:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:0.32 \
		/bin/sh

run-hugo-create-new-site:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:0.32 \
		hugo:newsite .

run-hugo-server:
	docker run -ti --rm --name hugo-server \
		-v $(shell pwd)/site:/data \
		ownport/hugo:0.32 \
		hugo:server
