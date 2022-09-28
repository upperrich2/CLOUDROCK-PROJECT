# CREAT A VPC

resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = var.cidr-block-for-vpc
  instance_tenancy = "default"
 tags = {
    Name = "Prod-rock-Vpc"
  }
}


# CREATE A PUBLIC SUBNET
resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-block-public-subnet-1

  tags = {
    Name = "Test-public-sub1"
  }
}
resource "aws_subnet" "Test-public-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-block-public-subnet-2

  tags = {
    Name = "Test-public-sub2"
  }
}

# PRIVATE SUBNET 

resource "aws_subnet" "Test-priv-sub1" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-block-private-subnet-1

  tags = {
    Name = "Test-priv-sub1"
  }
}



resource "aws_subnet" "Test-priv-sub2" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.cidr-block-private-subnet-2
  tags = {
    Name = "Test-priv-sub2"
  }
}
# CREAT ROUTE TABLE
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  
  tags = {
    Name = "Test-pub-route-table"
  }
}
resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route = []

  tags = {
    Name = "Test-priv-route-table"
  }
}
# ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "Test-pub-route-table-association-1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}


resource "aws_route_table_association" "Test-pub-route-table-association-2" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}


resource "aws_route_table_association" "Test-priv-route-table-association-1" {
  subnet_id      = aws_subnet.Test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}



resource "aws_route_table_association" "Test-priv-route-table-association-2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}
# internet gateway
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}
# ROUTE
  #internet gateway route
resource "aws_route" "Test-pub-route-table" {
  route_table_id            =  aws_route_table.Test-pub-route-table.id
  gateway_id                = aws_internet_gateway.Test-igw.id
  destination_cidr_block    = "0.0.0.0/0"
  
  
}
# ELASTIC IP

resource "aws_eip" "eip-nat-gateway-1" {
  vpc                       = true
}



# NAT GATEWAY
resource "aws_nat_gateway" "T-nat-gateway" {
  allocation_id = aws_eip.eip-nat-gateway-1.id
  subnet_id     = aws_subnet.Test-public-sub1.id

  tags = {
    Name = "T-nat-gateway"
  }

  
  depends_on = [aws_eip.eip-nat-gateway-1]
}



 

# private nat gateway
resource "aws_nat_gateway" "nat-gateway-private" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.Test-priv-sub1.id
}
