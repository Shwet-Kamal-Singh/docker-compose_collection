# Running MongoDB with Docker Compose

This guide explains how to set up a MongoDB database server using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration

This project provides a `docker-compose.yml` file that defines a MongoDB service with the following features:

* **Image:** Uses the latest official mongo image from Docker Hub.
* **Environment Variables:** Sets environment variables for the MongoDB root username and password.
* **Volumes:** Persists MongoDB data using a named volume named mongo-data.
* **Ports:** Maps the container's port 27017 to the host's port 27017, allowing external access to the database.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure the MongoDB service is running and accessible.
**Important:** 

* Replace the placeholder values `(root and example)` in the `docker-compose.yml` file with strong usernames and passwords for the MongoDB root user. **Never use these default credentials in production environments.**

* Consider using a separate user with appropriate permissions for your applications instead of the root user. Refer to the MongoDB documentation for security best practices.
### Running the Service

1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Open a terminal and navigate to the directory containing the docker-compose.yml file.
3. Run the following command to start the MongoDB service:
```Bash
docker-compose up -d
```
The -d flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Database
Once the service is running, you can connect to the `MongoDB database` from your client application using the following connection details:

* **Hostname:** localhost (if connecting from the same host machine)
* **Port:** 27017 (mapped from the container)
* **Username:** The username you specified in the MONGO_INITDB_ROOT_USERNAME environment variable (default: `root`)
* **Password:** The password you specified in the MONGO_INITDB_ROOT_PASSWORD environment variable (default: `example`)

**Security Note:** Remember to update the default credentials to strong passwords before using this configuration in a production environment. Refer to your client application's documentation for specific instructions on connecting to a MongoDB database.

### Stopping and Restarting the Service 
* To stop the MongoDB container:
```Bash
docker-compose stop mongodb
```

* To restart the MongoDB container:
```Bash
docker-compose up -d
```

### Persisting Data
The configuration uses a named volume (`mongo-data`) to persist the MongoDB data directory (`/data/db`) on the host machine. This ensures that your database data remains even if the container is recreated.

This script provides a basic overview of using the provided Docker Compose configuration for MongoDB. Feel free to customize the configuration further based on your specific requirements, and remember to prioritize security by using strong credentials and appropriate user permissions.