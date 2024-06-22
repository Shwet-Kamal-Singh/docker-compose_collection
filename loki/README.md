# Running Loki and Promtail with Docker Compose

This guide explains how to set up Loki, a horizontally scalable log aggregation service, and Promtail, a log collector, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/


### Using this Configuration
This project provides a docker-compose.yml file that defines two services:

* **loki:**
  * **Image:** Uses the latest `grafana/loki:latest` image from Docker Hub.
  * **Container Name:** Names the container "`loki`".
  * **Ports:** Maps host port 3100 to container port 3100, allowing access to the Loki web interface.
  * **Restart Policy:** Automatically restarts the container if it stops.
  * **Volumes:**
     * Mounts your local `loki-config.yml` file to the container's `/etc/loki/local-config.yaml`, providing configuration options for Loki.
     * Mounts your local `daemon.new.json` file to the container's `/etc/loki/daemon.json`, allowing configuration of advanced options (optional).
     * Mounts a named volume (`loki_data`) to the container's `/loki` directory for persisting Loki data.
  * **Command:** Starts Loki using the provided configuration file (`/etc/loki/local-config.yaml`).
  * **Health Check:** Configures a health check to verify Loki is running by sending an HTTP request to the `/ready` endpoint.

* **promtail:**
  * **Image:** Uses the latest grafana/promtail:latest image from Docker Hub.
  * **Container Name:** Names the container "promtail".
  * **Volumes:**
    * Mounts your local promtail-config.yml file to the container's /etc/promtail/config.yml, defining how Promtail collects and forwards logs.
    * Mounts the host's /var/log directory to the container's /var/log directory, allowing Promtail to access your system logs.
  * **Restart Policy:** Automatically restarts the container if it stops.
  * **Command:** Starts Promtail using the provided configuration file (/etc/promtail/config.yml).
  * **Health Check:** Configures a health check to verify Promtail is running by sending an HTTP request to the /ready endpoint.

### Important:

* You'll need to create your own loki-config.yml and promtail-config.yml files to configure Loki and Promtail according to your specific needs. Refer to the official documentation for configuration options:

* **Loki:** https://grafana.com/docs/loki/latest/configure/
* **Promtail:** https://grafana.com/docs/loki/latest/send-data/promtail/configuration/

* The `daemon.new.json` file is optional and allows for advanced configuration of Loki. Consult the Loki documentation for details.

### Running the Services
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Create the required configuration files: loki-config.yml and promtail-config.yml.
3. Update the configuration files with your desired settings.
(Optional) Create a daemon.new.json file for advanced Loki configuration.
4. Open a terminal and navigate to the directory containing the docker-compose.yml file.
5. Run the following command to start the Loki and Promtail containers:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the containers in detached mode (background).

### Accessing the Loki Web Interface

Once the services are running, you should be able to access the Loki web interface by opening a web browser and navigating to:

* `http://localhost:3100`
You can then use the Loki web interface to view and explore your collected logs.

### Additional Notes
* This is a basic setup for running Loki and Promtail with Docker Compose. Explore the official documentation for further configuration options and advanced usage:
  * **Loki:** https://grafana.com/docs/loki/latest/
  * **Promtail:** https://grafana.com/docs/loki/latest/send-data/promtail/

* Consider using environment variables to manage sensitive information within your configuration files.
* Explore integrating Loki with Grafana for log visualization and analysis.