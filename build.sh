#!/bin/bash
docker build --no-cache -t hackinglab/alpine-nodejs:3.2.0 -t hackinglab/alpine-nodejs:3.2 -t hackinglab/alpine-nodejs:latest -f Dockerfile .

