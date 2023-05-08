#!/usr/bin/env bash

docker compose up --detach
sleep 20

echo "Open Grafana (username: admin, password: admin): http://localhost:3000/d/hivemq-dashboard/hivemq-cluster-v2?orgId=1&from=now-5m&to=now&refresh=5s"

if ! [ -f ./mqtt-cli.jar ]; then
  curl --location https://github.com/hivemq/mqtt-cli/releases/download/v4.13.0/mqtt-cli-4.13.0.jar --output mqtt-cli.jar
fi
java -jar mqtt-cli.jar subscribe --identifier 'subscriber' --topic '#' --showTopics 2>&1 >/dev/null &

for i in {0..499}; do
  #echo $i;
  java -jar mqtt-cli.jar publish --identifier "publisher$i" \
    --topic "test/$i" --message "Hello$i" \
    --user 'admin-user' --password 'admin-password';
  sleep 3;
done