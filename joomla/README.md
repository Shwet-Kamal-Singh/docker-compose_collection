# Running Joomla with Docker Compose

This guide explains how to set up Joomla, a popular open-source Content Management System (CMS), using Docker Compose. It includes a MySQL database for data persistence.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Security Note:

* The provided configuration uses placeholder passwords for the MySQL root user and the Joomla database user. Replace these with strong, unique passwords before deploying this setup in a production environment.


### Using this Configuration
This project provides a docker-compose.yml file that defines two services:

* **joomla:**
   * **Image:** Uses the latest `joomla:latest` image from Docker Hub.
   * **Container Name:** Names the container "`joomla_container`".
   * **Ports:** Maps host port 8080 to container port 80, allowing access to the Joomla web interface.
   * **Restart Policy:** Automatically restarts the container if it stops.
   * **Environment Variables:** Sets up the database connection details for Joomla by referencing the db service.
   * **Health Check:** Configures a health check to verify Joomla is reachable by sending a `curl` request to the web interface.
   * **Volumes:** Mounts a named volume (`joomla_data`) to the container's `/var/www/html directory`, persisting Joomla data (`website content`, `configuration`).


* **db:**
   * **Image:** Uses the `mysql:5.7` image from Docker Hub, providing a MySQL database server.
   * **Container Name:** Names the container "`joomla_db_container`".
   * **Environment Variables:** Sets up the MySQL `root` `password`, `database name`, `username`, and `password`.
   * **Volumes:** Mounts a named volume (`db_data`) to the container's `/var/lib/mysql directory`, persisting the MySQL database data.
   * **Restart Policy:** Automatically restarts the container if it stops.
   * **Health Check:** Configures a health check to verify MySQL is running using the `mysqladmin` ping command.


### Important:

* Make sure to replace the placeholder passwords with strong, unique credentials for both the MySQL root user and the Joomla database user.
* This configuration uses local volumes for data persistence. Consider using a dedicated volume management solution for production environments.

### Running the Services
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Update the placeholder passwords in the environment variables for both services (`MYSQL_ROOT_PASSWORD`, `MYSQL_PASSWORD`, `JOOMLA_DB_PASSWORD`).
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start the Joomla and MySQL containers:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the containers in detached mode (background).

### Accessing the Joomla Web Interface
Once the services are running, you should be able to access the Joomla web interface by opening a web browser and navigating to:

* `http://localhost:8080` (assuming you mapped port 8080 to port 80)

**Note:**

* During the first run, you'll need to go through the Joomla installation process to set up your website.


### Additional Notes
* This is a basic setup for running Joomla with Docker Compose. Explore the official Joomla documentation for further configuration options and administration: https://docs.joomla.org/
* Consider using environment variables to manage other Joomla configuration settings.
* Refer to the documentation for the joomla and mysql Docker images for additional configuration options:
* **Joomla:** https://hub.docker.com/_/joomla
* **MySQL:** https://hub.docker.com/_/mysql

This guide helps you get started with a Joomla installation using Docker Compose. Remember to customize the configuration, secure your database credentials, and explore further options based on your specific needs.