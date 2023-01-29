# AWS EC2 Instance Terraform Module
# EC2 Instance that will be created in VPC Public Subnet
module "jenkins_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[0]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[0]
  key_name = var.instance_keypair
  user_data = file("./scripts/JenkinsServerInstallation.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}

module "ansible_control_node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[1]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[0]
  key_name = var.instance_keypair
  user_data = file("./scripts/AnsibleCNInstalltion.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}

module "ansible_mn_apache_tomcat" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[2]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[0]
  key_name = var.instance_keypair
  user_data = file("./scripts/AnsibleManagedNodeApache.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}

module "ansible_mn_docker" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[3]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[0]
  key_name = var.instance_keypair
  user_data = file("./scripts/AnsibleManagedNodeDocker.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}

module "nexus" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[4]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[1]
  key_name = var.instance_keypair
  user_data = file("./scripts/NexusInstallation.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}

module "sonarqube" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the required variables here
  name                   = var.instance_name[5]
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type[2]
  key_name = var.instance_keypair
  user_data = file("./scripts/SonarqubeInstallation.sh")
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  tags = local.common_tags
}