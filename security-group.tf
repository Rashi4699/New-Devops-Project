resource "aws_security_group" "web_traffic_sg" {
  name        = "web_traffic_allow"
  description = "Allow Web traffic"
  vpc_id      = aws_vpc.dev.id

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"     #All protocols (TCP, UDP, ICMP, etc.)
    cidr_blocks = ["0.0.0.0/0"]
  }

}