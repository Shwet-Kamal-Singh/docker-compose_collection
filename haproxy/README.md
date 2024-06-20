# Running HAProxy with Docker Compose
This guide explains how to set up HAProxy, a load balancer, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines an HAProxy container with the following features:

* **Image:** Uses the latest `haproxy:latest` image from Docker Hub.
* **Container Name:** Names the container "`haproxy_container`".
* **Ports:** Maps host ports 80 and 443 to container ports 80 and 443 respectively, allowing HAProxy to handle incoming traffic on these ports.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure HAProxy can load its configuration file (`haproxy.cfg`) by running the `haproxy -c -f` `/usr/local/etc/haproxy/haproxy.cfg` command.
* **Volume:** Mounts your local `haproxy.cfg` file to the container's `/usr/local/etc/haproxy/haproxy.cfg` location in read-only mode. This allows you to manage your configuration file outside the container.

### Optional Volumes:

The commented-out `volumes` section demonstrates how to mount an additional volume named `haproxy_data` for persistent data or configurations within the container (e.g., runtime statistics).

### Important:

* You'll need to create your own `haproxy.cfg` file with the specific configuration for your load balancing needs. Refer to the HAProxy documentation for configuration options: [invalid URL removed]

* The provided health check verifies if HAProxy can load the configuration file. You might want to consider additional health checks for your specific setup (e.g., checking the availability of backend servers).


### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Create your `haproxy.cfg` file with the appropriate configuration for your load balancing needs.
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the HAProxy container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing Backend Servers (through HAProxy)
Once HAProxy is running, you can access your backend servers through the mapped host ports (usually 80 or 443 depending on your configuration). HAProxy will distribute traffic according to the rules defined in your `haproxy.cfg` file.

### Additional Notes
* This basic setup provides a starting point for using HAProxy with Docker Compose. You'll need to customize the `haproxy.cfg` file to define your specific load balancing configuration (backend servers, health checks, etc.).
* Consider using environment variables in your `haproxy.cfg` to manage configuration details that might change between environments (e.g., development, staging, production).


This script provides a basic overview of using HAProxy with Docker Compose. Remember to explore further configuration options and customize the setup based on your specific load balancing requirements.