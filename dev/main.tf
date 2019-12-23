provider "aws"{
    region = "ap-south-1"
}

module "myvpc" {
   source = "../modules/vpc"
   vpc_cidr = " 10.10.0.0/16"
   tenancy = "default"
   vpc_id = "${module.myvpc.vpc_id}"
   subnet_cidr = "10.10.1.0/24"
}

module "my_ec2"{
     source = "../modules/ec2"
     ec2_count = 1
     instance_type = "t2.micro"
     subnet_id = "${module.myvpc.subnet_id}"
}
