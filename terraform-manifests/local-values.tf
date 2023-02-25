locals {
  instance_configurations = [
  {
    name         = "Jenkins-Server"
    instance_type = "t3.micro"
    user_data    = file("./scripts/JenkinsServerInstallation.sh")
  },
  {
    name         = "Ansible-Control-Node"
    instance_type = "t3.micro"
    user_data    = file("./scripts/AnsibleCNInstalltion.sh")
  },
  {
    name         = "AnsibleMN-Apache-Tomcat"
    instance_type = "t3.micro"
    user_data    = file("./scripts/AnsibleManagedNodeApache.sh")
  },
  {
    name         = "AnsibleMN-Docker-Host"
    instance_type = "t3.micro"
    user_data    = file("./scripts/AnsibleManagedNodeDocker.sh")
  },
  {
    name         = "Nexus-Server"
    instance_type = "t2.medium"
    user_data    = file("./scripts/NexusInstallation.sh")
  }
]

  common_tags = {
      owner = "Ashutosh"
      environment = "Dev"
  }
}
