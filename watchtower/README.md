

# Running Watchtower with Docker Compose
This guide explains how to set up Watchtower, a containerized service for automating Docker image updates, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Security Note:

* By default, Watchtower uses the Docker socket (`/var/run/docker.sock`) to communicate with Docker. This grants Watchtower a high level of permission within your Docker environment. Consider the security implications before deploying Watchtower in a production setting.


### Using this Configuration
This project provides a `docker-compose.yml` file that defines a service for running Watchtower:

* **watchtower:**
   * **Image:** Uses the latest `containrrr/watchtower:latest` image from Docker Hub.
   * **Container Name:** Names the container "`watchtower_container`".
   * **Environment Variables:**
      * Sets `WATCHTOWER_CLEANUP=true` to automatically remove unused image data after successful updates.
      * Sets `WATCHTOWER_POLL_INTERVAL=300` to configure the interval (in seconds) between checks for image updates (default: `300 seconds`, or `5 minutes`).
   * **Volumes:**
      * Mounts the Docker socket (`/var/run/docker.sock`) into the container, allowing Watchtower to interact with Docker.
   * **Restart Policy:** Automatically restarts the container if it stops.
   * **Health Check:** Configures a health check to verify Watchtower is running by sending a request to its web interface (default port 8080).
   * **Volumes (Optional):** Defines an optional volume (`watchtower_data`) for persisting Watchtower data (`configuration`).

### Important:

* Security: Using Watchtower in a production environment requires careful consideration of its wide-ranging permissions within Docker. Explore alternative update mechanisms or implement security measures to restrict Watchtower's access if needed.
* Environment Variables: The provided configuration uses recommended settings for `WATCHTOWER_CLEANUP` and `WATCHTOWER_POLL_INTERVA`L. You can adjust these values based on your preferences.


### Running Watchtower
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Open a terminal and navigate to the directory containing the docker-compose.yml file.
3. Run the following command to start the Watchtower container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Watchtower Web Interface (Optional)
* By default, Watchtower exposes a web interface on port 8080. You can access it to view logs and information about updates. However, this is for informational purposes only and typically not required for Watchtower's core functionality.

**Note:** Accessing the web interface might require additional configuration depending on your network setup.

### Additional Notes
* This is a basic setup for running Watchtower with Docker Compose. Explore the official Watchtower documentation for further configuration options and advanced usage: https://github.com/containrrr/watchtower
* Consider using environment variables to manage other Watchtower configuration settings.
* Refer to the Docker documentation for best practices regarding image updates: https://docs.docker.com/guides/workshop/03_updating_app/


This guide helps you get started with Watchtower for automated Docker image updates. Remember to prioritize security considerations, especially in production environments.