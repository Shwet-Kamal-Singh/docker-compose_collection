# Automated MySQL Backups with Docker Compose

This guide explains how to set up automatic backups for your MySQL database using Docker Compose.

### Prerequisites
* **Docker and Docker Compose:** Ensure you have Docker and Docker Compose installed and running on your system. Refer to the official documentation for installation instructions:
    * Docker: https://docs.docker.com/
    * Docker Compose: https://docs.docker.com/compose/gettingstarted/

### Using this Configuration
This project provides a `docker-compose.yml` file that defines two services:

1. **mysql:** This service uses the official `mysql:latest` image to run a MySQL database server.
2. **mysql-backup:** This service also uses the `mysql:latest` image, but for the purpose of creating periodic backups of your database.


**Important:**
* Replace all placeholder values (`examplepassword`, `exampledb`, `exampleuser`, and `exampleuserpassword`) in the `docker-compose.yml` file with strong passwords and usernames for your MySQL setup. **Never use these default credentials in production environments.**

### Service Breakdown
**mysql service:**
* Configures environment variables for the MySQL root password, database name, username, and user password.
* Uses a named volume (`mysql_data`) to persist the MySQL data directory (`/var/lib/mysql`).
* Defines a health check to ensure the MySQL service is running.


**mysql-backup service:**
* Depends on the ``mysql` service to ensure it starts only after the database is ready.
* Uses the same environment variables as the `mysql` service for connection details.
* Mounts a named volume (`mysql_backup`) to store the backups.
* Define a custom command using `bash -c` to:
   * Create a directory for backups (`/backup`) if it doesn't exist.
   * Run `mysqldump` command to create a backup of the `exampledb` database and save it as `backup.sql` inside the `/backup` directory.
* Uses a health check to verify the existence of the backup file (`backup.sql`).

### Running the Service
1. Clone this repository or copy the `docker-compose.yml` file to your desired location.
2. Update the placeholder values with your actual credentials and database details.
3. Open a terminal and navigate to the directory containing the `docker-compose.yml` file.
4. Run the following command to start both MySQL and backup services:
```Bash
docker-compose up -d
```
The -d flag instructs Docker Compose to run the containers in detached mode (background).

### Backup Schedule
This configuration creates a daily backup of your MySQL database by running the `mysqldump` command within the `mysql-backup` container. You can adjust the schedule by modifying the `healthcheck` interval in the `mysql-backup` service definition. For example, changing the `interval` to `12h` would create backups every 12 hours.

### Persisting Backups
The configuration uses a named volume (`mysql_backup`) to store the backup file (`backup.sql`). This ensures that your backups are preserved even if the `mysql-backup` container is recreated.

### Restoring from Backups
While this script focuses on automation, you can use the `mysqladmin` command to restore your database from the backup file (`backup.sql`) if needed. Refer to the MySQL documentation for instructions on restoring databases: https://phoenixnap.com/kb/how-to-backup-restore-a-mysql-database

**Security Note:** Remember to replace the placeholder credentials with strong passwords before using this configuration in production environments. Consider additional security measures like storing backups in a separate volume or off-site location.

This script provides a basic overview of using Docker Compose for automated MySQL backups. Feel free to customize the configuration further based on your specific requirements and prioritize security best practices.