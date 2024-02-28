# Création de la paire de clés SSH
resource "aws_key_pair" "ssh_key" {
  key_name   = var.ssh_key_name               # Nom de la paire de clés
  public_key = file(var.public_ssh_key_path)  # Chemin vers la clé publique SSH
}

# Création du groupe de sécurité
resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH access"
  
  vpc_id = var.aws_vpc_id  # ID du VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Autorise l'accès SSH depuis n'importe quelle adresse IP
  }
}

resource "aws_instance" "app_server" {
  ami           = var.aws_ami 
  instance_type = var.aws_instance_type
  key_name = aws_key_pair.ssh_key.key_name

  subnet_id = var.aws_subnet_id


  tags = {
    Name = var.aws_instance_name  # Nom de l'instance EC2, modifiez selon vos besoins
  }
}