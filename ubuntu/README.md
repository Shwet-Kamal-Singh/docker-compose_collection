# Running a Script in an Ubuntu Container with Docker Compose

This guide explains how to set up a basic environment for running a script inside an Ubuntu container using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/


* **Script:** You'll need your script file (e.g., `script.sh`) containing the commands you want to execute within the container.


### Using this Configuration

This project provides a `docker-compose.yml` file that defines a container for running your script with the following features:

* **Image:** Uses the latest `ubuntu:latest` image from Docker Hub, providing a base Ubuntu environment.
* **Container Name:** Names the container "`ubuntu_service_container`".
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a basic health check that simply echoes "`health check`" to verify the container is running. You can customize this for your specific needs.
* **Volumes:**
   * Mounts your local scripts directory containing your script file to the container's `/usr/local/scripts` directory. This allows you to update your script without rebuilding the image.
* **Working Directory:** Sets the working directory within the container to `/usr/local/scripts`.
* **Command:** Runs a shell script (`bash`) and executes your script (`script.sh`). Replace "`script.sh`" with the actual name of your script file.

### Important:

* Update the command section to specify the exact name of your script file within the mounted directory.
* The provided health check is a basic example. Consider implementing a more robust health check that reflects the functionality of your script.


### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
Place your script file (e.g., `script.sh`) in the scripts directory.

2. Make sure your script file has proper execution permissions (`chmod +x scripts/script.sh`).
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the Ubuntu container and execute your script:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Container (Optional)
* While the provided configuration runs your script in the background, you might need to access the container for troubleshooting or interacting with running processes. Use the following command to connect to a running container's shell:

```Bash
docker exec -it ubuntu_service_container bash
```
This command will open a bash shell within the container, allowing you to execute commands and interact with the running environment.

### Additional Notes
* This is a basic example for running a script in an Ubuntu container. You might need to adjust the configuration based on your specific script's requirements (e.g., `additional dependencies`, `environment variables`).
* The commented-out volumes section demonstrates how to mount an additional volume for persistent data storage within the container (e.g., `script outputs`, `logs`).

This guide helps you get started with running scripts inside Ubuntu containers using Docker Compose. Remember to customize the configuration, implement appropriate health checks, and explore further options based on your specific script's functionality.