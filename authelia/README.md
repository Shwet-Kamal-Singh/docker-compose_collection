#  Running Authelia with Docker Compose
This guide explains how to set up Authelia, a multi-factor authentication (MFA) provider, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

* **Authelia Configuration Files:** You'll need to create two configuration files for Authelia:
   * `configuration.yml:` This file defines the overall configuration for Authelia, including providers, rules, and other settings. Refer to the Authelia documentation for configuration options: https://www.authelia.com/integration/deployment/docker/

   * `users_database.yml:` This file defines the user accounts and their associated MFA providers. Refer to the Authelia documentation for user management: https://www.authelia.com/integration/deployment/docker/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines an Authelia service with the following features:

* **Image:** Uses the latest authelia/authelia image from Docker Hub.
* **Container Name:** Names the container "authelia".
* **Volumes:** Mounts two volumes:
  * `./configuration.yml:/etc/authelia/configuration.yml`: This mounts your custom Authelia configuration file located in the current directory (`./`) to the container's configuration directory (`/etc/authelia/configuration.yml`).
  * `./users_database.yml:/etc/authelia/users_database.yml`: This mounts your user database file located in the current directory (`./`) to the container's user database directory (`/etc/authelia/users_database.yml`).
* **Ports:** Maps host port 9091 to container port 9091, allowing access to the Authelia web interface.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure Authelia is running.

### Important:

* Replace the placeholder directories (`./configuration.yml` and `./users_database.yml`) in the `docker-compose.yml` file with the actual location of your configuration files on your host machine.

* You'll need to create both configuration files with your desired settings for Authelia.


### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Create the `configuration.yml` and `users_database.yml` files in the same directory as the `docker-compose.yml` file. Configure your desired settings in these files.
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the Authelia service:
```Bash
docker-compose up -d
```
The -d flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Authelia Web Interface
Once the service is running, you should be able to access the Authelia web interface by opening a web browser and navigating to:

* `http://localhost:9091`
**Note:** You might need to adjust the URL depending on where you placed your Docker Compose files on your system.

### Using Authelia
After configuring your providers and users in the respective YAML files, you can use Authelia to add MFA to your web applications. Refer to the Authelia documentation for detailed instructions: https://www.authelia.com/integration/prologue/get-started/

### Stopping and Restarting the Service
* To stop the Authelia container:
```Bash
docker-compose stop authelia
```
* To restart the Authelia container:
```Bash
docker-compose up -d
```

### Persisting Data
While this configuration doesn't define a named volume for persisting data, consider using a volume for the `/var/lib/authelia` directory within the container if you require persistent storage for user sessions or other Authelia data. Refer to the Authelia documentation for volume usage: https://www.authelia.com/integration/deployment/docker/

**Security Note:** Remember to properly configure your MFA providers and user accounts in the YAML files. Avoid storing sensitive information like passwords in plain text.

This guide helps you get started with Authelia using Docker Compose.  Remember to adjust the configuration files and volume usage based on your specific requirements, and prioritize security best practices.