# AWS Variables
variable aws_region {
    type        = string
    default     = "eu-west-3"
    description = "AWS Region."
}

variable aws_profile {
  type        = string
  default     = "ema2024"
  description = "AWS Profile"
}


variable shared_credentials_files {
    type        = list(string)
    default     = ["~/.aws/profile"]
    description = "Profile path where there are your credentials."
}

variable ssh_key_name {
  type        = string
  default     = "SSH-Key"
  description = "SSH Key name"
}

variable public_ssh_key_path {
    type        = string
    default     = "~/.ssh/aws_key.pub"
    description = "Public SSH key path."
}

variable aws_vpc_id {
    type        = string
    description = "VPC ID"
}

variable aws_ami {
    type        = string
    default     = "ami-0dfdff9941ebfbd48"
    description = "Amazon Machine Image"
}

variable aws_instance_type {
  type        = string
  default     = "t3.micro"
  description = "Instance type"
}

variable aws_subnet_id {
  type        = string
  description = "Subnet ID"
}

variable aws_instance_name {
  type        = string
  default     = "EC2 Instance"
  description = "Instance name"
}

