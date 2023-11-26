#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Please provide command to execute: 'up', 'stop' or 'restart'"
  exit 1
fi

command="$1"

for stack in stacks/*/*
do
  case "$command" in
    "up")
      docker-compose -f "${stack}" --env-file .env up -d
      ;;
    "stop")
      docker-compose -f "${stack}" --env-file .env stop
      ;;
    "restart")
      docker-compose -f "${stack}" --env-file .env restart
      ;;
    *)
      echo "Wrong command. Please use 'up', 'stop' or 'restart'"
      exit 1
      ;;
  esac
done
