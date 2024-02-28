# AWS EC2 Instance with Terraform

This Terraform configuration creates an AWS EC2 instance with the specified parameters.

## Prerequisites

Before you begin, ensure you have:

- An AWS account.
- AWS credentials configured on your machine.
- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.

## Usage

### Module declaration

To use this module in your Terraform configuration, add the following code:

```hcl
# Load module
module "aws-module" {
    source = "git@github.com:poncincs/terraform-aws-module.git"

    aws_region                = "eu-west-3"
    aws_profile               = "ema2024"
    aws_shared_credentials_files_path  = ["~/.aws/profile"]
    aws_public_ssh_key_path       = "~/.ssh/aws_key.pub"
    aws_vpc_id                = "vpc-X"
    aws_ami                   = "ami-X"
    aws_instance_type         = "t3.micro"
    aws_subnet_id             = "subnet-X"
    aws_instance_name         = "Terraform"
}

# Output values from the module
output "instance_public_ip" {
    value = module.terraform-aws-module.instance_public_ip
}
```

### Input variables

You can customize the EC2 instance by modifying the variables in `main.tf`. Here are the configurable variables:

- `aws_ssh_key_name`: Name of the SSH key pair.
- `aws_public_ssh_key_path`: Path to the public SSH key file.
- `aws_ami`: ID of the AMI to use for the EC2 instance.
- `aws_instance_type`: Type of the EC2 instance.
- `aws_subnet_id`: ID of the subnet where the EC2 instance will be launched.
- `aws_instance_name`: Name tag for the EC2 instance.

### Run

1. Clone this repository:

```bash
git clone https://github.com/votre-utilisateur/votre-repo.git
```

2. Navigate to the cloned directory:

```bash
cd votre-repo
```

3. Open `main.tf` and modify the variables according to your requirements.

4. Initialize Terraform:

```bash
terraform init
```

5. Review the changes Terraform will make:

```bash
terraform plan
```

6. Apply the Terraform configuration to create the AWS EC2 instance:

```bash
terraform apply
```

Type `yes` when prompted to confirm.

7. Once the instance is created, you can find its public IP address in the Terraform output.

8. To destroy the resources created by Terraform (including the EC2 instance), run:

```bash
terraform destroy
```

Type `yes` when prompted to confirm.

## Customization

Feel free to customize this project by adding new features or adjusting configurations to fit your specific needs.
