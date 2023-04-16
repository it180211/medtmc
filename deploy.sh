#!/usr/bin/env bash

pushd www
hugo
popd

pushd k8s
./deploy.sh
popd

pushd www
./deploy.sh
popd