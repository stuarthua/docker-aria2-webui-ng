#!/usr/bin/env bash

docker image build -t aria2-webui-ng .
docker login

# default tag latest
docker tag aria2-webui-ng stuarthua/aria2-webui-ng
docker push stuarthua/aria2-webui-ng

# clean
docker rmi stuarthua/aria2-webui-ng