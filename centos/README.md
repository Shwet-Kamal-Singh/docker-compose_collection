# Running a CentOS Container with Docker Compose
This guide explains how to set up a basic CentOS container using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines a CentOS container with the following features:

* **Image:** Uses the `centos:latest` image from Docker Hub.
* **Container Name:** Names the container "centos_container".
* **Command:** Runs the `tail -f /dev/null` command to keep the container running in the foreground. This is a placeholder; you can replace it with your desired command(s) to be executed within the container.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure the container can access the internet using `ping google.com`.
* **Volume:** Mounts a local directory (`./data`) to the container's `/data` directory, allowing you to persist data between container restarts.
* **Environment Variable:** Defines an example environment variable named `ENV_VAR` with the value "`example`". You can add more environment variables as needed.
* **Port Mapping:** Maps host port 8080 to container port 80. This allows you to access any web service running on port 80 within the container by browsing to `http://localhost:8080` in your web browser (assuming the container exposes a web service).

### Important:

* Adjust the `command` section to specify the actual commands you want to run within the container.
* Update the volume mount paths (`./data:/data`) if you want to use a different directory on your host machine.
* Define additional environment variables as needed for your specific use case.
* The port mapping (`8080:80`) is for illustrative purposes. Only map ports if your container exposes a service you want to access from the host.

### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
3. Run the following command to start the CentOS container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Container (if applicable)
If your container exposes a service (e.g., a web server running on port 80 within the container), you can access it by opening a web browser and navigating to:

`http://localhost:8080`

**Note:** This assumes you mapped host port 8080 to container port 80 in the docker-compose.yml file. Adjust the port number based on your configuration and the container's exposed port.

### Stopping and Restarting the Container
* To stop the CentOS container:
```Bash
docker-compose stop centos_container
```
* To restart the CentOS container:
```Bash
docker-compose up -d
```

This script provides a basic example of using Docker Compose with a CentOS container. Remember to customize the configuration based on your specific requirements and the commands you want to run within the container.