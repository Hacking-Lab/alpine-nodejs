#!/bin/bash

docker build --no-cache -t hackinglab/alpine-nodejs:$1.0 -t hackinglab/alpine-nodejs:$1 -t hackinglab/alpine-nodejs:latest -f Dockerfile .

docker push hackinglab/alpine-nodejs
docker push hackinglab/alpine-nodejs:$1
docker push hackinglab/alpine-nodejs:$1.0

