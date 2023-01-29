#! /bin/bash

# Install Java
amazon-linux-extras install java-openjdk11 -y

# Download and Install Jenkins
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y

# Start Jenkins
systemctl start jenkins

# Enable jenkins (It will start automatically at the next system restart)
systemctl enable jenkins

# Install Git SCM
yum install git -y

# Make sure Jenkins comes up when reboot
chkconfig jenkins on