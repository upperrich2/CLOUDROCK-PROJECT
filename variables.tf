
variable "region-name" {
  default= "eu-west-2"
  description = "region-name"
}

# VPC
variable "cidr-block-for-vpc" {
  default       = "10.0.0.0/16"
  

  
    description = "cidr-block-for-vpc"
  }
  variable "cidr-block-public-subnet-1"{
 default = "10.0.1.0/24"
 description = "cidr-block-public-subnet-1"
  }
   variable "cidr-block-public-subnet-2"{
 default = "10.0.2.0/24"
 description = "cidr-block-public-subnet-2"
  }

  variable "cidr-block-private-subnet-1"{
    default  = "10.0.3.0/24"
    description = "cidr-block-private-subnet-1"
  }
  

 variable "cidr-block-private-subnet-2"{
    default  = "10.0.4.0/24"
    description = "cidr-block-private-subnet-2"
  }
