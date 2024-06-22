# Running Plex Media Server with Docker Compose

This guide explains how to set up Plex Media Server, a popular application for managing and streaming your personal media library, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/


* **Plex Media Server Account:** You'll need a Plex Media Server account to claim your server and access remote features. Create an account at https://plex.tv/.

### Using this Configuration

This project provides a `docker-compose.yml` file that defines a service for running Plex Media Server:

* **plex:**
   * **Image:** Uses the latest `plexinc/pms-docker:latest` image from Docker Hub.
   * **Container Name:** Names the container "`plex_container`".
   * **Environment Variables:**
     * Sets the timezone for Plex (`TZ`).
     * Sets the Plex claim token (`PLEX_CLAIM`) to automatically claim the server during startup. You'll need to obtain this token from your Plex Media Server account after creating your server.
   * **Volumes:**
     * Mounts your local `./config` directory to the container's `/config` directory, persisting Plex configuration data (e.g., `library settings`).
     * Mounts your local `./transcode` directory to the container's `/transcode` directory, persisting temporary transcoding data.
     * Mounts your local media data directory (`./data`) to the container's `/data `directory. This is where you'll store your media files (`movies`, `TV shows`, `music`, etc.).
   * **Ports:**
     
     Maps various ports for Plex functionality:
     * `32400:32400/tcp` for the Plex web interface (primary access point).
     * `3005:3005/tcp` for communication with Plex clients (apps, devices).
     * Ports for Plex functionality on various devices (Smart TVs, DLNA, discovery protocols).
   * **Restart Policy:** Automatically restarts the container if it stops.
   * **Health Check:** Configures a health check to verify Plex is running by sending a request to the web interface.
   * **Volumes (Optional):** Defines an optional volume (`plex_data`) for persisting additional Plex data.


### Important:

* Replace '`your_plex_claim_token`' with your actual Plex claim token obtained from your Plex Media Server account.
* Adjust the mounted directory paths (`./config`, `./transcode`, and `./data`) to match your local directory structure where you store Plex configuration and media files.
* Consider using a dedicated volume management solution for production environments.

### Running Plex Media Server
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Obtain your Plex claim token by creating a server in your Plex Media Server account and following the on-screen instructions. Update the `PLEX_CLAIM` environment variable with your obtained token.
3. Create the directories `./config`, `./transcode`, and `./data` (or adjust the paths in the volumes section) for storing Plex configuration and media files.
4. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
6. Run the following command to start the Plex Media Server container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Plex Web Interface

Once Plex Media Server is running, you should be able to access the web interface by opening a web browser and navigating to:

* `http://<your_host_IP>:32400`

You'll then be able to sign in to your Plex account and manage your media library. Plex clients on various devices can be configured to connect to your server using the server's claim name or IP address.

### Additional Notes

* This is a basic setup for running Plex Media Server with Docker Compose. Explore the official Plex documentation for further configuration options and advanced usage: https://support.plex.tv/articles/

* Consider using environment variables to manage other Plex configuration settings.
* Refer to the Plex documentation for managing libraries, users, and other functionalities.

This guide helps you get started with Plex Media Server using Docker Compose. Remember to customize the configuration based on your media storage