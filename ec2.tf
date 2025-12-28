data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_1.id
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data              = file("user_data.sh")

  tags = {
    Name = "Assignment4-EC2-Web"
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_1.id

  tags = {
    Name = "Assignment4-EC2-Backend"
  }
}
