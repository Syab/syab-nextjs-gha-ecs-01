module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "nextjs_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  enable_nat_gateway = true
  enable_vpn_gateway = true

  enable_dns_hostnames = true

  tags = {
    project = "nextjs-gha-ecs-01"
    terraform = "true"
    environment = "dev"
  }
}