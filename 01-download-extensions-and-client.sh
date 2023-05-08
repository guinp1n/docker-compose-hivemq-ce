#!/usr/bin/env bash

if ! [ -d ./hivemq-prometheus-extension ]; then
  curl --silent --location https://github.com/hivemq/hivemq-prometheus-extension/releases/download/4.0.8/hivemq-prometheus-extension-4.0.8.zip \
    --output ./hivemq-prometheus-extension.zip
  unzip ./hivemq-prometheus-extension.zip -d .
  rm ./hivemq-prometheus-extension.zip
fi

if ! [ -d ./hivemq-file-rbac-extension ]; then
  curl --silent --location https://github.com/hivemq/hivemq-file-rbac-extension/releases/download/4.5.3/hivemq-file-rbac-extension-4.5.3.zip \
    --output ./hivemq-file-rbac-extension.zip
  unzip ./hivemq-file-rbac-extension.zip -d .
  rm ./hivemq-file-rbac-extension.zip
fi

if ! [ -f ./mqtt-cli.jar ]; then
  curl -L https://github.com/hivemq/mqtt-cli/releases/download/v4.13.0/mqtt-cli-4.13.0.jar -o mqtt-cli.jar
fi
