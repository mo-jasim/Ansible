# EC2 Variable
variable "ec2_instance_name" {
  description = "This is used for renaming ec2 instance"
  default = "custom-vpc-server"
  type = string
}

variable "ec2_instance_type" {
  description = "AWS Instance Selections"
  default = "t3.micro"
  type = string
}

variable "ec2_volume_size" {
  description = "This is used for maintaining the volume size ec2 instance"
  default = 10
  type = number
}

variable "ec2_instance_count" {
  description = "Instance Count"
  default = 1
  type = number
}

variable "ec2_security_group_name" {
  description = "Security Group Name"
  default = "my-security-group"
  type = string
}

variable "ec2_running_state" {
  description = "This is used for maintaining the ec2 instance state"
  default = "running"
  type = string
}

variable "ssh_key_name" {
  description = "SSH Key Name"
  default = "jasim"
  type = string
}

variable "public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "./jasim.pub"
}

# variable "ec2_instance_ami" {
#   description = "AWS AMI Selections"
#   default = "ami-05d2d839d4f73aafb"
#   type = string
# }

variable "ec2_instance_ami" {

  description = "Map of instance names to AMI IDs, SSH users, and OS family"
  
  type = map(object({
    ami       = string
    user      = string
    os_family = string
    instance_type = string
  }))

  # by deafult value to be put in the variable
  default = {
    "control-node-ubuntu" = {
      ami       = "ami-07a00cf47dbbc844c" # Ubuntu Server 24.04 LTS
      user      = "ubuntu"
      os_family = "ubuntu"
      instance_type = "t3.micro"
    }
    "worker-ubuntu" = {
      ami       = "ami-07a00cf47dbbc844c" # Ubuntu Server 24.04 LTS 
      user      = "ubuntu"
      os_family = "ubuntu"
      instance_type = "t3.micro"
    }
    "worker-redhat" = {
      ami       = "ami-00a3ff43223e36738" # RHEL 9 
      user      = "ec2-user"
      os_family = "redhat"
      instance_type = "t3.micro"
    }
    "worker-amazon" = {
      ami       = "ami-01b40e1bcccae197a" # Amazon Linux 2023 — update for your region
      user      = "ec2-user"
      os_family = "amazon"
      instance_type = "t3.micro"
    }
  }
}

# Remote Backend
variable "remote_bucket_name" {
  description = ""
  default = "mojasim-remote-s3-bucket"
  type = string
}

variable "remote_dynamodb_table" {
  description = ""
  default = "remote-backend-db"
  type = string
}

variable "remote_aws_region" {
  description = ""
  default = "ap-south-1"
  type = string
}

# VPC Variables
variable "vpc_name" {
  description = "Vpc name"
  default = "custom_vpc"
  type = string
}

variable "internet_gateway_name" {
  description = "internet_gateway_name"
  default = "custom_igw"
  type = string
}

variable "subnet_name" {
  description = "subnet_name"
  default = "public_subnet"
  type = string
}

variable "route_table_name" {
  description = "route_table_name"
  default = "public-route-table"
  type = string
}

variable "vpc_cidr_block" {
  description = ""
  default = "192.0.0.0/16"
  type = string
}

variable "subnet_cidr_block" {
  description = ""
  default = "192.0.1.0/24"
  type = string
}

variable "route_table_cidr_block" {
  description = ""
  default = "0.0.0.0/0"
  type = string
}