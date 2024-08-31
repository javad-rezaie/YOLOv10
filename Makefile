docker-build-paddle:
	DOCKER_BUILDKIT=1 docker build \
	-f docker/paddle.Dockerfile \
	-t paddle .