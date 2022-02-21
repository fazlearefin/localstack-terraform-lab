#!/usr/bin/env bash

SOURCE_DOCKER_COMPOSE_FILE='https://raw.githubusercontent.com/localstack/localstack/master/docker-compose.yml'

mkdir -p .localstack
cd ./.localstack
wget -c $SOURCE_DOCKER_COMPOSE_FILE

printf "%s\n" "Starting localstack. Press Ctrl-c to stop localstack"
docker-compose up -d && docker-compose logs -f
docker-compose down

cd -
