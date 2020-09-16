lint:
		docker run --rm -i hadolint/hadolint < Dockerfile

build:
		sh ./scripts/docker-build.sh

upload:
		sh ./scripts/docker-upload.sh
