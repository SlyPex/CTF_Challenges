#!/bin/bash

set -euo pipefail

CHALL_NAME=$CI_MERGE_REQUEST_SOURCE_BRANCH_NAME

if [[ $DEPLOY_ENV = "Dockerfile" ]]
then
	docker buildx build $DIRECTORY/$CHALL_NAME/ --load -t "$(echo $CHALL_NAME | tr '[A-Z]' '[a-z]')":latest
	docker run -d "$(echo $CHALL_NAME | tr '[A-Z]' '[a-z]')":latest
	docker ps -a
	docker stop $(docker ps -q)
elif [[ $DEPLOY_ENV = "docker-compose" ]]
then
	docker compose -f $DIRECTORY/$CHALL_NAME/docker-compose.yml up -d --build
	docker ps -a
	sleep 5
	docker compose -f $DIRECTORY/$CHALL_NAME/docker-compose.yml down
fi