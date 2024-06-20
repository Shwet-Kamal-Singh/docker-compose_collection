# Running InfluxDB with Docker Compose

This guide explains how to set up InfluxDB, a time series database, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a docker-compose.yml file that defines an InfluxDB container with the following features:

* **Image:** Uses the latest `influxdb:latest` image from Docker Hub.
* **Container Name:** Names the container "`influxdb_container`".
* **Ports:** Maps host port 8086 to container port 8086, allowing access to the InfluxDB web interface.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to verify InfluxDB is reachable by sending a ping command to the HTTP API endpoint (`http://localhost:8086`).
* **Volumes:**
   * Mounts a named volume named influxdb_data to the container's `/var/lib/influxdb2 `directory. This allows persisting InfluxDB data (`series`, `measurements`) between container restarts.
   * Mounts your local `config/influxdb.conf` file to the container's `/etc/influxdb/influxdb`.conf location in read-only mode. This allows you to manage your configuration file outside the container.
* **Environment Variables:**
   * Sets the name of the default database (`INFLUXDB_DB=mydatabase`).
   * Sets the username for accessing InfluxDB (`INFLUXDB_ADMIN_USER=admin`).
   * Sets the password for the admin user (`INFLUXDB_ADMIN_PASSWORD=adminpassword`).
   * Enables HTTP authentication for InfluxDB (`INFLUXDB_HTTP_AUTH_ENABLED=true`).


### Important:

* Replace the placeholder values for the database name, username, and password with your desired credentials.
* You can customize the InfluxDB configuration file (influxdb.conf) with additional settings. Refer to the InfluxDB documentation for configuration options: https://docs.influxdata.com/
* The provided health check uses the ping command. Consider using a more robust health check that verifies writing or querying data if applicable for your setup.

### Running the Service
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Create the config/influxdb.conf file with your desired InfluxDB configuration (optional).
3. Open a terminal and navigate to the directory containing the docker-compose.yml file.
4. Run the following command to start the InfluxDB container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the InfluxDB Web Interface

Once the service is running, you should be able to access the InfluxDB web interface by opening a web browser and navigating to:

`http://localhost:8086`

**Note:** You'll need to use the username and password you defined in the environment variables to log in.

### Additional Notes
* This basic setup provides a starting point for using InfluxDB with Docker Compose. You can explore additional configuration options and data management tools based on your needs.
* Consider using a separate volume for the InfluxDB configuration file if you want to manage it independently from the container updates.


This guide helps you get started with InfluxDB using Docker Compose. Remember to customize the configuration, security credentials, and data management strategies based on your specific requirements.