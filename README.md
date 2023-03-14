# docker-compose-hivemq-ce
Docker compose YAML for running HiveMQ-CE with Prometheus Monitoring Extension and Grafana


## How to use

1. Clone this repo
2. Download and unzip the [HiveMQ Prometheus Extension](https://www.hivemq.com/extension/prometheus-extension/) to the working directory
3. Run docker compose up in the working directory
4. Open Grafana UI with HiveMQ Cluster dashboard
5. Test (publish a few messages) with an MQTT client

The following instructions describe each step in detail.

### 1. Clone this repo and go to the directory
Clone the repo
```
git clone https://github.com/guinp1n/docker-compose-hivemq-ce.git
```
Change the working directory
```
cd docker-compose-hivemq-ce
```

### 2. Download the Prometheus Monitoring Extension
Download the extension zip file
```
curl -L https://github.com/hivemq/hivemq-prometheus-extension/releases/download/4.0.8/hivemq-prometheus-extension-4.0.8.zip \
-o ./hivemq-prometheus-extension.zip
```
Unzip into the working directory
```
unzip ./hivemq-prometheus-extension.zip -d .
```

### 3. Run the docker compose up
Run the docker compose up in the directory where the docker-compose.yml file is located:
```
docker compose up
```
When the HiveMQ has started successfully, there is the message in the log:
```
INFO  - Started HiveMQ in ...s
```

### 4. How to reach Grafana
1. Open Grafana at http://localhost:3000. Log in with default user `admin` and password `admin`.
2. Open the dashboard "HiveMQ Cluster V2" at http://localhost:3000/dashboards

### 5. How to test with MQTT client
1. Download MQTT client [MQTT-CLI](https://hivemq.github.io/mqtt-cli/):
```
curl -L https://github.com/hivemq/mqtt-cli/releases/download/v4.13.0/mqtt-cli-4.13.0.jar -o mqtt-cli.jar
```
2. Check the Java version
```
java -version
openjdk version "11.0.18" 2023-01-17
```
Make sure you have at least Java version 11!

3. Run MQTT client

In one terminal window run the client to subscribe to all topics:
```
java -jar mqtt-cli.jar subscribe -i subscriber -t # -T
```

In another terminal window run the client to publish a few messages:
```
for i in {0..499}; do echo $i; java -jar mqtt-cli.jar pub -i publisher$i -t test/$i -m Hello$i; sleep 2; done
```
