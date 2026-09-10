resource "aws_instance" "new-project" {
  ami           = "ami-01a00762f46d584a1" 
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
  aws_security_group.web_traffic_sg.id
  ]

  key_name = "project-key"

  tags = {
    Name = "DevEc2Instance"
  }

}

