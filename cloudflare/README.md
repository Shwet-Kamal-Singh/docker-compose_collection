# Running Cloudflare Dynamic DNS (DDNS) with Docker Compose

This guide explains how to set up automatic updates for your Cloudflare Dynamic DNS (DDNS) record using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

* **Cloudflare Account:** You'll need a Cloudflare account with a registered domain name.
* **Cloudflare API Key:** Create a Cloudflare API Token with the "Zone - DNS - Edit" permission for the zone you want to update. 

Refer to https://developers.cloudflare.com/fundamentals/api/get-started/create-token/ for instructions.


### Using this Configuration
This project provides a `docker-compose.yml` file that defines a service named cloudflare-ddns using the `oznu/cloudflare-ddns` image. Here's a breakdown of the configuration:

* **Image:** Uses the latest oznu/cloudflare-ddns image from Docker Hub.
* **Environment Variables:** Sets environment variables for various configurations:
* **PROXIED:** Set to "true" if you want Cloudflare to proxy traffic for your subdomain (optional).
* **ZONE:** Replace with your actual Cloudflare zone (domain name).
* **SUBDOMAIN:** Replace with the subdomain you want to update the IP address for.
* **API_KEY:** Replace with your generated Cloudflare API key.
* **EMAIL:** Replace with your Cloudflare account email address.
* **Restart Policy:** Automatically restarts the container if it stops.
* **Health Check:** Configures a health check to ensure the service is running.

**Important:** Replace all placeholder values `(example.com, sub.example.com, your_cloudflare_api_key, and your_email@example.com)` in the `docker-compose.yml` file with your actual details. 

**Never share your API key publicly.**

### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Open a terminal and navigate to the directory containing the docker-compose.yml file.
3. Run the following command to start the Cloudflare DDNS service:

```Bash
docker-compose up -d
```
The -d flag instructs Docker Compose to run the container in detached mode (background).

### Service Operation
The `cloudflare-ddns` container will periodically check your server's public IP address and update the corresponding DNS record for your subdomain in your Cloudflare zone.

### Stopping and Restarting the Service
To stop the Cloudflare DDNS container:
```Bash
docker-compose stop cloudflare-ddns
```
To restart the Cloudflare DDNS container:
```Bash
docker-compose up -d
```
### Additional Notes
* This configuration uses a health check to monitor the service's functionality.
Consider reviewing the `oznu/cloudflare-ddns` image documentation on Docker Hub for more advanced configuration options.
* This script provides a basic overview of using the provided Docker Compose configuration for automatic Cloudflare DDNS updates. Remember to keep your API key secure and adjust the configuration based on your specific needs.




