-- Create database and user for Ghost
CREATE DATABASE IF NOT EXISTS ghost CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'ghost'@'%' IDENTIFIED BY 'your_ghost_password';
GRANT ALL PRIVILEGES ON ghost.* TO 'ghost'@'%';
FLUSH PRIVILEGES;
