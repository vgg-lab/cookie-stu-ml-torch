#!/usr/bin/env bash

# Fail on error and unset variables.
set -eu -o pipefail

CWD=$(readlink -e "$(dirname "$0")")
cd "${CWD}/.." || exit $?
source ./docker/common.sh

DEVICE=0
echo "Using GPU devices: ${DEVICE}"


docker run \
    -it --rm \
    --name "{{cookiecutter.project_name}}" \
    --gpus all \
    --privileged \
    --shm-size 8g \
    -v "${HOME}/.netrc":/root/.netrc \
    -v "${CWD}/..":/workspace \
    -v "/mnt/scratch/${USER}":/workspace/.mnt/scratch \
    -v "/mnt/persist/${USER}":/workspace/.mnt/persist \
    -e CUDA_VISIBLE_DEVICES="${DEVICE}" \
    ${IMAGE_TAG} \
    "$@" || exit $?
