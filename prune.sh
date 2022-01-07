#!/bin/bash

docker kill messi_goat


docker container prune
docker image prune -a