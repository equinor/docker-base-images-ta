#!/bin/bash
set -e

echo "Logging in to registry [docker.io]"
docker login docker.io

ORGANIZATION_NAME=equinorta

echo "Will build and push to ${ORGANIZATION_NAME}"

cd images

for IMAGE_NAME in `find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n'`
do
    echo "Building image ${IMAGE_NAME}"
    cd "${IMAGE_NAME}"
    IMAGE_TAG="${ORGANIZATION_NAME}/${IMAGE_NAME}:latest"
    docker build --pull --squash --tag ${IMAGE_TAG} .
    echo "Pushing ${IMAGE_TAG}"
    docker push ${IMAGE_TAG}
    cd -
done
