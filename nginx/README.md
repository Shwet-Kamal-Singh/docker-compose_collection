# Running Nginx with Docker Compose and Custom Configuration
This guide explains how to set up a web server using Nginx with a custom configuration and HTML content using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

* **Text Editor:** You'll need a text editor to create your custom Nginx configuration file (`nginx.conf`).

### Using this Configuration
This project provides a `docker-compose.yml` file that defines an Nginx service with the following features:

* **Image:** Uses the latest official nginx image from Docker Hub.
* **Ports: Maps host ports 80 (HTTP) and 443 (HTTPS) to container ports 80 and 443 respectively, allowing external access to your web server.
* **Volumes: Mounts two volumes:

`./nginx.conf:/etc/nginx/nginx.conf:ro:` This mounts your custom Nginx configuration file located in the current directory (`./`) to the container's configuration directory (`/etc/nginx/nginx.conf`). The :ro option specifies read-only access for the container.

`./html:/usr/share/nginx/html:ro:` This mounts a directory containing your HTML files (located in the current directory (`./`)) to the container's web root directory (`/usr/share/nginx/html`). The :ro option specifies read-only access for the container.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure Nginx is serving the default page.

**Important:**

* Replace the placeholder directories (`./nginx.conf and ./html`) in the `docker-compose.yml` file with the actual location of your configuration file and HTML content directory on your host machine.
* You'll need to create the `nginx.conf` file with your desired server configuration. Refer to the official Nginx documentation for configuration options: https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/

### Running the Service

1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Create the `nginx.conf` file in the same directory as the `docker-compose.yml` file. Configure your desired server settings in this file.
3. Create a directory named `html` (or adjust the name as needed) in the same location and place your HTML files inside it.
4. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
5. Run the following command to start the Nginx service:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing your Website
Once the service is running, you should be able to access your website by opening a web browser and navigating to:

* `http://localhost` (for HTTP access)
* `https://localhost` (for HTTPS access, if configured in your `nginx.conf`)

**Note:** You might need to adjust the URL depending on where you placed your Docker Compose files on your system.

### Stopping and Restarting the Service
* To stop the Nginx container:
```Bash
docker-compose stop nginx
```
* To restart the Nginx container:
```Bash
docker-compose up -d
```

### Customizing your Configuration
This script provides a basic setup for Nginx with a custom configuration file and HTML content. You can further customize the Nginx configuration based on your specific needs. Refer to the Nginx documentation for available options.

**Remember:**

* Adjust the volume mount paths in the `docker-compose.yml` file to match your directory structure.
* Update the `nginx.conf` file with your desired server configuration.
* Consider using environment variables in your nginx.conf for sensitive information like SSL certificates.

This guide helps you get started with Nginx using Docker Compose. Feel free to explore further configuration options and customize the setup to meet your web server requirements.