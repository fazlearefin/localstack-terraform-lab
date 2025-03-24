#!/usr/bin/env bash

set -Eeuo pipefail

SOURCE_DOCKER_COMPOSE_FILE='https://raw.githubusercontent.com/localstack/localstack/master/docker-compose.yml'
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

mkdir -p .localstack
cd ./.localstack
wget -c $SOURCE_DOCKER_COMPOSE_FILE

printf "%s\n" "Starting localstack. Press Ctrl-c to stop localstack"
docker compose up -d && docker compose logs -f
docker compose down

cd -
