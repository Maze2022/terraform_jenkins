#--jenkins-server/main.tf

data "aws_ami" "instance_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*.0-x86_64-gp2"]
  }
}

# resource "aws_key_pair" "jserv-auth" {
#   key_name = var.key_name
#   public_key = "mykeys.pub"
# }

#Create Jenkins server
resource "aws_instance" "jenkins-server" {
ami           = data.aws_ami.instance_ami.id
instance_type = var.instance_type
associate_public_ip_address = true
user_data = var.user_data
# key_name  = aws_key_pair.jserv-auth.id

tags = {
    Name = var.tag
# key_name = aws_key_pair.jserv_auth.id
 }
}
  

#Jenkins-server security group

resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Allows inbound traffic"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


