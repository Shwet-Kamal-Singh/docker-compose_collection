# Running Pi-hole with Docker Compose

This guide explains how to set up Pi-hole, a popular ad blocker for your network, using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Security Note:

* The provided configuration uses a placeholder password for the Pi-hole web interface. Replace '`your_password`' with a strong, unique password before deploying this setup.

### Using this Configuration

This project provides a `docker-compose.yml` file that defines a service for running Pi-hole:

* **pihole:**
  * **Image:** Uses the latest `pihole/pihole:latest` image from Docker Hub.
  * **Container Name:** Names the container "`pihole_container`".
  * **Environment Variables:**
    * Sets the timezone for Pi-hole (`TZ`).
    * Sets the password for the Pi-hole web interface (`WEBPASSWORD`). Replace the placeholder with your chosen password.
  * **Volumes:**
    * Mounts your local `./etc-pihole` directory to the container's `/etc/pihole directory`, persisting Pi-hole configuration and data (e.g., `blocklists`).
    * Mounts your local `./etc-dnsmasq.d` directory to the container's `/etc/dnsmasq.d directory`, allowing you to add custom DNS entries.
  * **Ports:**
    * Maps various ports for Pi-hole functionality:
    * `53:53/tcp` and `53:53/udp` for DNS traffic (`TCP` and `UDP`).
    * `80:80/tcp` for the Pi-hole web interface over `HTTP`.
    * `443:443/tcp` for the Pi-hole web interface over `HTTPS` (requires additional configuration for SSL certificates).
  * **Restart Policy:** Automatically restarts the container if it stops.
  * **Capabilities:** Grants the container the `NET_ADMIN` capability, required for network configuration.
  * **Health Check:** Configures a health check to verify Pi-hole is running by performing a DNS lookup for `pi.hole` on the local DNS server (itself).
  * **Volumes (Optional):** Defines an optional volume (`pihole_data`) for persisting additional Pi-hole data.


### Important:

* Replace the placeholder password (`your_password`) with a strong, unique password for the Pi-hole web interface.
* Consider using a dedicated volume management solution for production environments.
* The provided configuration exposes the web interface over both HTTP and HTTPS (commented out). You'll need to add SSL certificates for secure HTTPS access.


### Running Pi-hole
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Update the WEBPASSWORD environment variable with your chosen password.
3. (Optional) Create the directories `./etc-pihole` and `./etc-dnsmasq.d` for persistent configurations (if not already existing).
4. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
5. Run the following command to start the Pi-hole container:
```Bash
docker-compose up -d
```
The `-d` flag instructs Docker Compose to run the container in detached mode (background).

### Accessing the Pi-hole Web Interface

Once Pi-hole is running, you should be able to access the web interface by opening a web browser and navigating to:

* `http://<your_host_IP>:80` (for `HTTP` access)


### Note:

* You'll need to configure your network devices (routers, etc.) to use the Pi-hole container's IP address as the primary DNS server for ad blocking to take effect.

### Additional Notes
* This is a basic setup for running Pi-hole with Docker Compose. Explore the official Pi-hole documentation for further configuration options and advanced usage: https://docs.pi-hole.net/
* Consider using environment variables to manage other Pi-hole configuration settings.
* Refer to the Pi-hole documentation for securing the web interface with HTTPS: [invalid URL removed]

This guide helps you get started with Pi-hole using Docker Compose. Remember to customize the
