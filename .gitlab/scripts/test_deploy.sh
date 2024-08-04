#!/bin/bash

set -euo pipefail

CHALL_PATH=$1
CHALL_NAME="$(echo "$1" | cut -d '/' -f 2)"

if [[ "$DEPLOY_ENV" = "Dockerfile" ]]
then
	docker buildx build "$CHALL_PATH"/ --load -t "$(echo "$CHALL_NAME" | tr '[:upper:]' '[:lower:]')":latest
	docker run -d "$(echo "$CHALL_NAME" | tr '[:upper:]' '[:lower:]')":latest
	docker ps -a
	docker stop "$(docker ps -q)"
elif [[ $DEPLOY_ENV = "docker-compose" ]]
then
	docker compose -f "$CHALL_PATH"/docker-compose.yml up -d --build
	docker ps -a
	sleep 5
	docker compose -f "$CHALL_PATH"/docker-compose.yml down
fi