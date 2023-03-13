#!/usr/bin/env bash

if ! [ -d ./hivemq-prometheus-extension ]; then
  curl --silent --location https://github.com/hivemq/hivemq-prometheus-extension/releases/download/4.0.8/hivemq-prometheus-extension-4.0.8.zip \
    --output ./hivemq-prometheus-extension.zip
  unzip ./hivemq-prometheus-extension.zip -d .
fi

docker compose up -d
sleep 20

echo "Open Grafana UI at: http://localhost:3000/d/hivemq-dashboard/hivemq-cluster-v2?orgId=1&from=now-5m&to=now&refresh=5s"

curl --silent --location https://github.com/hivemq/mqtt-cli/releases/download/v4.13.0/mqtt-cli-4.13.0.jar --output mqtt-cli.jar

java -jar mqtt-cli.jar subscribe -i subscriber -t '#' -T 2>&1 >/dev/null &

for i in {0..499}; do
  #echo $i;
  java -jar mqtt-cli.jar pub -i publisher$i -t test/$i -m Hello$i;
  sleep 2;
done