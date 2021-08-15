#!/usr/bin/env bash
set -e

docker ps > /dev/null || (echo 'ERROR: Docker daemon not running' && exit 1)

if [ -f /dev/ttyUSB0 ]; then
  UPLOAD_CMD="--device /dev/ttyUSB0"
else
  DEVICE=""
fi

alias esphome="docker run --rm -v ${PWD}:/config ${DEVICE} -it esphome/esphome"

esphome compile "$1"
esphome upload "$1"
esphome logs "$1"
