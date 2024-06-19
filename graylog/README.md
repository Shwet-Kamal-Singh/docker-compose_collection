# Running Graylog with Docker Compose
This guide explains how to set up a Graylog instance for centralized log management using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

* **Graylog Configuration Files:** You'll need two configuration files for Graylog:
    * `graylog.conf:` This file defines the overall configuration for Graylog, including inputs, outputs, and other settings. Refer to the Graylog documentation for configuration options: https://go2docs.graylog.org/5-0/setting_up_graylog/server.conf.html
    * `log4j2.xml:` This file configures the logging behavior for Graylog itself. Refer to the Apache Logging Services Project (Log4j) documentation for configuration options: https://logging.apache.org/log4j/2.x/manual/configuration.html


**Security Note:**

* Replace `somepasswordpepper` in the `GRAYLOG_PASSWORD_SECRET ` environment variable with a strong and random password or secret. This is used for password hashing within Graylog.

* **Do not** commit the value for the `GRAYLOG_ROOT_PASSWORD_SHA2 `environment variable to your version control system (e.g., Git). Instead, generate a strong password for the Graylog root user and calculate its SHA2 hash using a secure tool.


### Using this Configuration
This project provides a `docker-compose.yml` file that defines a multi-container setup for Graylog with the following features:

**MongoDB:** Uses the `mongo:4.2` image to run a MongoDB database server for storing Graylog data.
**Elasticsearch:** Uses the `docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2` image to run an Elasticsearch cluster for indexing logs.
**Graylog:** Uses the `graylog/graylog:4.1` image to run the Graylog server itself.

The configuration includes:

* Environment variables for setting the Graylog password secret and root password hash.
* Volumes for persisting data for Elasticsearch and Graylog.
* Mounting your custom configuration files (`graylog.conf` and `log4j2.xml`) for Graylog.
* Port mappings for accessing the Graylog web interface and GELF UDP input.
* Health checks for each service to ensure they are running.
* Dependencies defined for Graylog to ensure it starts only after Elasticsearch is ready.

### Important:

* Replace the placeholder directories (`./config/graylog.conf` and `./config/log4j2.xml`) in the `docker-compose.yml` file with the actual location of your configuration files on your host machine.
* You'll need to create both configuration files with your desired settings for Graylog.


### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Create the `graylog.conf` and `log4j2.xml` files in the config directory (or adjust the paths in the `docker-compose.yml` file). Configure your desired settings in these files.
3. Generate a strong password for the Graylog root user and calculate its SHA2 hash using a secure tool. Update the `GRAYLOG_ROOT_PASSWORD_SHA2` environment variable in the `docker-compose.yml` file with the calculated hash.
4. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
5. Run the following command to start all the Graylog services:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the containers in detached mode (background).

### Accessing the Graylog Web Interface
Once the service is running, you should be able to access the Graylog web interface by opening a web browser and navigating to:

* `http://localhost:9000/`

You'll need to log in using the credentials configured in the `GRAYLOG_ROOT_PASSWORD_SHA2` environment variable.

### Sending Logs to Graylog
Refer to the Graylog documentation for instructions on configuring log inputs to send your application logs to Graylog: https://go2docs.graylog.org/5-2/getting_in_log_data/inputs.htm

### Stopping and Restarting the Service
* To stop all Graylog services:
```Bash
docker-compose stop
```
* To restart all Graylog services:
```Bash
docker-compose up -d
```