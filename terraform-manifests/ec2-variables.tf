# AWS EC2 Instance Terraform Variables

variable "instance_type" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t3.micro", "t2.medium", "t3.xlarge"]  
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type = list(string)
  default = ["Jenkins-Server", "Ansible-Control-Node", "AnsibleMN-Apache-Tomcat", "AnsibleMN-Docker-Host", "Nexus-Server"]
}

variable "instance_keypair" {
  description = "EC2 Instance Keypair"
  type = string
  default = "devops-project-keypair"
}
