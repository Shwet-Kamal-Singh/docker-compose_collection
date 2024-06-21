# Running Prometheus with Docker Compose
This guide explains how to set up Prometheus, a monitoring tool, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines a Prometheus container with the following features:

* **Image:** Uses the latest `prom/prometheus` image from Docker Hub.
* **Container Name:** Names the container "`prometheus_container`".
* **Ports:** Maps host port 9090 to container port 9090, allowing access to the Prometheus web interface.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure Prometheus is ready by checking the `/-/ready` endpoint for a successful response.
* **Volume:** Mounts a named volume named `prometheus_data` to the container's `/prometheus` directory. This allows persisting Prometheus data (rules, alerts) between container restarts.


### Important:

* The provided health check queries the `/-/ready` endpoint. This is a recommended approach for checking Prometheus readiness.

### Running the Service
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Open a terminal and navigate to the directory containing the docker-compose.yml file.
3. Run the following command to start the Prometheus container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Prometheus Web Interface
Once the service is running, you should be able to access the Prometheus web interface by opening a web browser and navigating to:

* http://localhost:9090

### Persisting Data
The configuration uses a named volume (`prometheus_data`) to persist Prometheus data on the host machine. This ensures that your rules, alerts, and other data remain even if the container is recreated.

### Additional Notes
* You can explore additional configuration options for Prometheus by referring to the official documentation: https://prometheus.io/docs/prometheus/latest/getting_started/
* This basic setup doesn't configure any scraping targets for Prometheus. You'll need to define scraping targets (e.g., Node exporters, application endpoints) in the Prometheus configuration file (`prometheus.yml`) to collect metrics.

This guide helps you get started with Prometheus using Docker Compose. Remember to explore further configuration options and scraping target definitions based on your monitoring needs.