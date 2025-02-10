#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# -lt 1 ]; then
  echo "Please provide command to execute: 'up', 'stop', 'restart', or 'recreate'"
  exit 1
fi

command="$1"

case "$command" in
  "up")
    for stack in "$BASE_DIR"/stacks/*/*
    do
      docker compose -f "${stack}" --env-file "$BASE_DIR/.env" up -d
    done
    ;;
  "stop" | "restart")
    for stack in "$BASE_DIR"/stacks/*/*
    do
      docker compose -f "${stack}" --env-file "$BASE_DIR/.env" $command
    done
    ;;
"recreate")
    if [ $# -eq 2 ]; then
      stack_name="$2"
      service_name="$2"
    elif [ $# -eq 3 ]; then
      stack_name="$2"
      service_name="$3"
    else
      echo "Usage: $0 recreate <stack_name> <service_name>"
      exit 1
    fi

    stack_file="$BASE_DIR/stacks/${stack_name}/${stack_name}.yml"

    if [ ! -f "$stack_file" ]; then
      echo "Stack file '$stack_file' does not exist"
      exit 1
    fi

    docker compose -f ${stack_file} --env-file "$BASE_DIR/.env" stop ${service_name}
    docker compose -f ${stack_file} --env-file "$BASE_DIR/.env" rm -f ${service_name}
    docker compose -f ${stack_file} --env-file "$BASE_DIR/.env" up -d ${service_name}
    ;;
  *)
    echo "Wrong command. Please use 'up', 'stop', 'restart', or 'recreate'"
    exit 1
    ;;
esac

