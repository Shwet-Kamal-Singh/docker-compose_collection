## WireGuard Docker Compose Setup

This repository provides a Docker Compose configuration for setting up a secure and easy-to-manage WireGuard VPN server.

### Prerequisites

* **Docker and Docker Compose:** Installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/install/
* **Basic understanding of WireGuard concepts (optional).**


### Before You Begin

#### Generate WireGuard Keys:

Use a tool like `wg` on your system or an online key generator to create a server private key and public key, as well as public keys for each peer you want to connect. Store these keys securely.

**Note:** To edit the `docker-compose.yml` file and mount volumes, you'll need administrator privileges on your system.

#### Configure Peer Information (Optional):

**docker-compose.yml** file resides in the project root directory. Edit it to replace the following placeholders:

* `yourdomain.com`: Replace with the actual public IP address or domain name of your server.
* `SERVERPORT` (default: 51820): Change this if you need to use a different port for the WireGuard server.
* `PEERS`: Adjust this value to match the number of peers you intend to connect.

**Optional Configuration:**

* `PEERDNS`: Configure peer DNS settings within the `docker-compose.yml` file for more granular control.
* `INTERNAL_SUBNET`: Define your desired internal subnet configuration within the `docker-compose.yml` file.


### Deployment Steps

#### Clone the Repository:
```Bash
git clone https://github.com/your-username/wireguard-docker-compose.git
```

#### Create WireGuard Configuration Directory (Optional):
If you don't have an existing directory for your WireGuard configuration files, create one:
```Bash
mkdir -p /path/to/wireguard/config
```
Replace `/path/to/wireguard/config` with the desired directory path on your system.

#### Place Server Configuration File:
* Create a file named `wg0.conf` (or any filename you prefer) inside the configuration directory `(/path/to/wireguard/config)` and paste your server's WireGuard configuration (including private and public keys, allowed IP addresses, etc.).

#### Start the WireGuard Server:
Navigate to the cloned repository directory and run:
```Bash
docker-compose up -d
```

The `-d` flag instructs Docker Compose to run the container in detached mode (background).

#### Configure Peer Devices: 

*  Use the generated server public key (from step 1) and the endpoint information (public IP or domain, port) to configure your peer devices (laptops, phones, etc.) according to their WireGuard client software.
*  Detailed instructions for configuring peer devices can vary depending on the client software. Refer to the client software's documentation for specific steps.

### Accessing Resources over the VPN

Once your peers are connected to the WireGuard VPN server, they can access resources within your network as if they were directly connected. The specific configuration within your network will determine how routing and access control are handled. Consult your network documentation for guidance.

#### Stopping and Restarting the Server:

* To stop the WireGuard server container:
```Bash
docker-compose stop
```
*  To restart the server container:
```Bash
docker-compose up -d
```

### Security Considerations

* Keep Your Keys Secure: Do not share your server private key or peer public keys with anyone you don't trust completely. These keys are essential for securing the VPN connection.
* Firewall Rules: Consider configuring appropriate firewall rules on your server to restrict access to the WireGuard server port (default: 51820) only from authorized IP addresses or networks.
* Regular Updates: Keep the Docker engine and the linuxserver/wireguard Docker image updated to benefit from the latest security fixes.


### Additional Notes

* This configuration example provides a basic setup for a WireGuard server using Docker Compose. You can customize it further to suit your specific needs.

* For more advanced configurations, refer to the official WireGuard documentation: [https://www.wireguard.com/quickstart/]
