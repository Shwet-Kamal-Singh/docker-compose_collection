# Running Grafana with Docker Compose
This guide explains how to set up Grafana, a data visualization tool, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines a Grafana container with the following features:

* **Image:** Uses the latest `grafana/grafana` image from Docker Hub.
* **Container Name:** Names the container "`grafana_container`".
* **Ports:** Maps host port 3000 to container port 3000, allowing access to the Grafana web interface.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure Grafana is accessible by attempting to connect to the login page (`http://localhost:3000/login`).
* **Volume:** Mounts a named volume named `grafana_data` to the container's `/var/lib/grafana` directory. This allows persisting Grafana data (dashboards, configurations) between container restarts.

### Important:

* The provided health check attempts to connect to the login page. Consider using a dedicated health check endpoint provided by Grafana if available in the image version you're using. Refer to the Grafana documentation for details: https://grafana.com/docs/grafana/latest/

### Running the Service
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Open a terminal and navigate to the directory containing the docker-compose.yml file.
3. Run the following command to start the Grafana container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Grafana Web Interface
Once the service is running, you should be able to access the Grafana web interface by opening a web browser and navigating to:

* http://localhost:3000


### Persisting Data
The configuration uses a named volume (`grafana_data`) to persist Grafana data on the host machine. This ensures that your dashboards, configurations, and other data remain even if the container is recreated.

### Additional Notes
* You can explore additional configuration options for Grafana by referring to the official documentation: https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/

* This basic setup doesn't configure any data sources for Grafana. You'll need to configure data sources (e.g., Prometheus, InfluxDB) to visualize data within Grafana.


This guide helps you get started with Grafana using Docker Compose. Remember to explore further configuration options and data source integrations based on your specific needs.