#!/bin/bash

# Update the package repository
sudo apt-get update

# Install Java
sudo apt-get install -y openjdk-8-jdk

# Download the Jenkins package
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Start the Jenkins service
sudo systemctl start jenkins

# Enable the Jenkins service to start automatically at boot
sudo systemctl enable jenkins

# Add the firewall rule to allow incoming connections on port 8080
sudo ufw allow 8080/tcp
