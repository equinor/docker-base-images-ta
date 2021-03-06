#!/bin/bash
set -e

echo "Logging in to registry [docker.io]"
docker login docker.io || echo Could not log in to docker.io

ORGANIZATION_NAME=equinorta

echo "Will build and push to ${ORGANIZATION_NAME}"

NO_PROXY=$(env | grep -i no_proxy | head -n 1 | cut -d '=' -f 2)
HTTP_PROXY=$(env | grep -i https_proxy | head -n 1 | cut -d '=' -f 2)
HTTPS_PROXY=$(env | grep -i https_proxy | head -n 1 | cut -d '=' -f 2)

cd images

for IMAGE_NAME in "dotnet-3.1-runtime-node-12" "dotnet-3.1-sdk-node-12"
do
    echo "Building image ${IMAGE_NAME}"
    cd "${IMAGE_NAME}"
    IMAGE_TAG="${ORGANIZATION_NAME}/${IMAGE_NAME}:latest"
    docker build --tag ${IMAGE_TAG} --build-arg no_proxy="${NO_PROXY}" --build-arg http_proxy="${HTTP_PROXY}" --build-arg https_proxy="${HTTPS_PROXY}" --cache-from ${IMAGE_TAG} $@ .
    echo "Pushing ${IMAGE_TAG}"
    docker push ${IMAGE_TAG} || echo Could not push
    cd -
done
