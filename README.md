# docker-compose-hivemq-ce
Docker-compose for running HiveMQ CE in a Docker container with
- File RBAC extension
- Prometheus Monitoring extension
- Prometheus and Grafana

## How to use

1. Clone this repo and change to the working directory:
    ```
    git clone https://github.com/guinp1n/docker-compose-hivemq-ce.git
    cd docker-compose-hivemq-ce
    ```
2. Run `./01-download-extensions-and-client.sh`
3. Run `02-run-docker-compose.sh`

If everything was correct, open Grafana: http://localhost:3000/d/hivemq-dashboard/hivemq-cluster-v2?orgId=1&from=now-5m&to=now&refresh=5s


