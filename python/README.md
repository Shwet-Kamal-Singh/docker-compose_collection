# Running a Python Application with Docker Compose

This guide explains how to set up a basic environment for running a Python application using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

* **Python Application:** You'll need your Python application code organized in a directory (e.g., `app`).

### Using this Configuration

This project provides a `docker-compose.yml` file that defines a container for your Python application with the following features:

* **Image:** Uses the latest `python:latest` image from Docker Hub, providing a Python runtime environment.
* **Container Name:** Names the container "`python_app_container`".
* **Ports: Maps host port 5000 to container port 5000, allowing access to your application (assuming it listens on this port).
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to verify your application's health by sending a curl request to a specific endpoint (`http://localhost:5000/health`). Update this path if your application exposes a different health check endpoint.
* **Volumes:**
   * Mounts your local app directory containing your Python application code to the container's `/usr/src/app` directory. This allows you to develop and update your application code without rebuilding the image.
* **Working Directory:** Sets the working directory within the container to `/usr/src/app`.
* **Command:** Runs the Python application using the python command, specifying the main application script (`app.py`).

### Important:

* Update the command section to specify the exact name of your main Python script within the mounted directory (e.g., `main.py` instead of `app.py` if that's your main script).

* The provided health check assumes your application exposes a `/health` endpoint that returns a successful response when healthy. Adapt the health check path based on your application's specific health check mechanism.

### Running the Service
1. Clone this repository or copy the docker-compose.yml file to your desired location.
2. Place your Python application code in the app directory.
3. Open a terminal and navigate to the directory containing the docker-compose.yml file.
4. Run the following command to start the Python application container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing Your Application

Once the service is running, you should be able to access your Python application by opening a web browser and navigating to:

* `http://localhost:5000` (assuming your application listens on port 5000)

**Note:** The actual URL to access your application might differ depending on your application's specific configuration.

### Additional Notes

* This is a basic example for running a Python application. You might need to adjust the configuration based on your specific application's requirements (e.g., additional dependencies, environment variables).
* The commented-out volumes section demonstrates how to mount an additional volume for persistent data storage within the container (e.g., application logs, configuration files).
* Consider using a multi-stage build approach to create a smaller image for your application in production environments. Refer to the Docker documentation for multi-stage builds: https://docs.docker.com/build/building/multi-stage/


This guide helps you get started with running a Python application using Docker Compose. Remember to customize the configuration and explore further options based on your application's specific needs.