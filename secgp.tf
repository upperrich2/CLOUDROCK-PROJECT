# CREAT SECURITY GROUP
# CREATE A SECURITY GROUP
resource "aws_security_group" "upper-sec-group" {
  name        = "upper-sec-group"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "upper-sec-group"
  }
}