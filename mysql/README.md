# Running MySQL with Docker Compose

This guide explains how to set up a MySQL database server using Docker Compose.

### Prerequisites

* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration

This project provides a `docker-compose.yml` file that defines a MySQL service with the following features:

* **Image:** Uses the latest official `mysql` image from Docker Hub.
* **Environment Variables:** Sets environment variables for the MySQL root password, database name, username, and user password.
* **Volumes:** Persists MySQL data using a named volume named `mysql-data`.
* **Ports:** Maps the container's port 3306 to the host's port 3306, allowing external access to the database.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure the MySQL service is running and accessible.

**Note:** Replace the placeholder values (`rootpassword`, `mydatabase`, `myuser`, and `mypassword`) in the `docker-compose.yml` file with your desired credentials and database name.

### Running the Service

1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
3. Run the following command to start the MySQL service:

```bash
docker-compose up -d
```

### Accessing the Database
Once the service is running, you can connect to the `MySQL database` from your client application using the following connection details:

* **Hostname:** localhost (if connecting from the same host machine)
* **Port:** 3306 (mapped from the container)
* **Username:** The username you specified in the MYSQL_USER environment variable `(default: myuser)`
* **Password:** The password you specified in the MYSQL_PASSWORD environment variable `(default: mypassword)`
* **Database:** The database name you specified in the MYSQL_DATABASE environment variable `(default: mydatabase)`


Refer to your client application's documentation for specific instructions on connecting to a MySQL database.

### Stopping and Restarting the Service

#### To stop the MySql container:
```Bash
docker-compose stop mysql
```

#### To restart the MySql container:
```Bash
docker-compose up -d
```

### Persisting Data
The configuration uses a named volume `(mysql-data)` to persist the MySQL data directory `(/var/lib/mysql)` on the host machine. This ensures that your database data remains even if the container is recreated.

This script provides a basic overview of using the provided Docker Compose configuration for MySQL. Feel free to customize the configuration further based on your specific requirements.  Remember to choose strong passwords and consider additional security measures for production environments.