# CREATE EC2 INSTANCE


#create ec2
resource "aws_instance" "Test-Server-1" {
ami= "ami-0be590cb7a2969726" #eu-west-2
instance_type = "t2.micro"
 key_name = "Prod-cloudrock"
 vpc_security_group_ids= [aws_security_group.upper-sec-group.id]
 associate_public_ip_address = true
 subnet_id= aws_subnet.Test-public-sub1.id

tags = {
}
}

#create ec2
resource "aws_instance" "Test-Server-2" {
ami= "ami-0be590cb7a2969726" #eu-west-2
instance_type = "t2.micro"
 key_name = "Prod-cloudrock"
 vpc_security_group_ids = [aws_security_group.upper-sec-group.id]
 associate_public_ip_address = true
 subnet_id= aws_subnet.Test-priv-sub1.id

tags = {

}
}
