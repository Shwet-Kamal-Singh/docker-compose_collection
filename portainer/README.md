# Running Portainer with Docker Compose

This guide explains how to set up Portainer, a web-based UI for managing Docker containers, using Docker Compose.


### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/


### Permissions:

* By default, the provided configuration mounts the Docker socket (`/var/run/docker.sock`) into the container. This grants Portainer full access to manage your Docker environment. Be cautious when running Portainer in a production setting and consider using security mechanisms (e.g., ACLs) if necessary. Refer to the Portainer documentation for more details: https://docs.portainer.io/


### Using this Configuration
This project provides a docker-compose.yml file that defines a Portainer container with the following features:

* **Image:** Uses the latest `portainer/portainer-ce` image from Docker Hub (Community Edition).
* **Container Name:** Names the container "`portainer_container`".
* **Ports:** Maps host port 9000 to container port 9000, allowing access to the Portainer web UI.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to verify the Portainer UI is accessible by sending a curl request to `http://localhost:9000`.
* **Volumes:**
   * Mounts the Docker socket (`/var/run/docker.sock`) from the host machine into the container (`/var/run/docker.sock`). This allows Portainer to interact with your Docker daemon.
   * Mounts your local data directory to the container's `/data` directory. This is an optional volume for persisting Portainer data between container restarts (e.g., `volumes`, `stacks`).

### Important:

* The provided configuration grants Portainer full access to manage Docker objects (`containers`, `volumes`, `networks`, etc.) on the host machine. Evaluate your security needs and potentially implement additional access controls if running Portainer in a production environment.

### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Create the `data` directory on your host machine if you want to persist Portainer data (optional).
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the Portainer container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Portainer Web UI

Once the service is running, you should be able to access the Portainer web UI by opening a web browser and navigating to:

`http://localhost:9000`

**Note:**

* The first time you access Portainer, you'll be prompted to set an admin password. Choose a strong password for enhanced security.

### Additional Notes
* This basic setup provides a starting point for using Portainer with Docker Compose.
* Explore the Portainer web UI for functionalities like managing containers, images, volumes, and networks.
* Refer to the Portainer documentation for further details on configuration options and advanced usage: https://docs.portainer.io/


This script provides a guide to running Portainer. Remember to consider the security implications of granting full Docker access and implement appropriate security measures if needed.