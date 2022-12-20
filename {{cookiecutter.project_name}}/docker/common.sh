#!/usr/bin/env bash

# Fail on error and unset variables.
set -eu -o pipefail

IMAGE_TAG="${IMAGE_TAG:-"{{cookiecutter.project_name}}"}"
PROJECT_NAME="{{cookiecutter.project_name}}"
