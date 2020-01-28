.PHONY: build push

# export the variable VERSION, e.g.:
# export VERSION="1"

build:

	docker build -t brutale/docker-aws-cli .
	docker tag brutale/docker-aws-cli:latest brutale/docker-aws-cli:v${VERSION}

push:

	docker push brutale/docker-aws-cli:v${VERSION}
	docker push brutale/docker-aws-cli:latest
