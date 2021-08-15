#!/usr/bin/env bash

set -e

for i in *.yaml;
do
  if [[ "$i" != "secrets.yaml" ]]
  then
    esphome config "$i"
  fi
done
