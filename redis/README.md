# Running Redis with Docker Compose
This guide explains how to set up a Redis in-memory data store using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/


### Using this Configuration
This project provides a docker-compose.yml file that defines a Redis service with the following features:

* **Image:** Uses the latest official `redis` image from Docker Hub.
* **Container Name:** Names the container "`redis`".
* **Ports:** Maps host port 6379 to container port 6379, allowing access to the Redis server.
* **Volumes:** Mounts a named volume named `redis-data` to the container's `/data` directory. This persists the Redis data directory on the host machine, ensuring your data remains even if the container is recreated.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure the Redis service is running.
**Important:**
* Consider using a password for Redis in production environments to enhance security. Refer to the Redis documentation for security best practices: https://redis.io/topics/security


### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
3. Run the following command to start the Redis service:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing Redis
Once the service is running, you can connect to the Redis server from your application using a Redis client library. The connection details are:

* Hostname: `localhost` (if connecting from the same host machine)
* Port: `6379`
**Note:** You might need to adjust the hostname depending on your application's environment.

### Stopping and Restarting the Service
* To stop the Redis container:
```Bash
docker-compose stop redis
```
* To restart the Redis container:
```Bash
docker-compose up -d
```

### Persisting Data
The configuration uses a named volume (`redis-data`) to persist the Redis data directory on the host machine. This ensures that your data remains even if the container is recreated.

This script provides a basic overview of using the provided Docker Compose configuration for Redis. Feel free to explore further configuration options and customize the setup based on your specific requirements.