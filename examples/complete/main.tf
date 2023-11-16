module "namer" {
  source = "../../"

  prefix = ["namer", "prod"]
}

module "namer_with_additional_identifier_verb" {
  source = "../../"

  with_additional_identifier_verb = true
  prefix                          = ["namer", "prod"]
}

locals {
  cidr_block = "10.0.0.0/16"
  default_tags = {
    "Terraform" = "True"
  }
  region             = "ap-northeast-2"
  availability_zones = ["a", "c"]
}

#######
# VPC #
#######
resource "aws_vpc" "this" {
  cidr_block = local.cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = merge(local.default_tags, {
    "Name" = module.namer.virtual_private_cloud
  })
}

#######
# IGW #
#######
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.default_tags, {
    "Name" = module.namer.internet_gateway
  })
}

##################
# Public Subnets #
##################
resource "aws_subnet" "public_subnet_bastion" {
  for_each = toset(local.availability_zones)

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false

  cidr_block        = cidrsubnet(local.cidr_block, 2, index(local.availability_zones, each.key))
  availability_zone = "${local.region}${each.key}"

  tags = merge(local.default_tags, {
    "Name" = format(module.namer.subnet, "bastion", "pub", each.key)
  })
}

resource "aws_route_table_association" "public_route_bastion" {
  for_each = toset(local.availability_zones)

  subnet_id      = aws_subnet.public_subnet_bastion[each.key].id
  route_table_id = aws_route_table.public_route_bastion[each.key].id
}

resource "aws_route_table" "public_route_bastion" {
  for_each = toset(local.availability_zones)

  vpc_id = aws_vpc.this.id

  tags = merge(local.default_tags, {
    "Name" = format(module.namer.route_table, "bastion", "pub", each.key)
  })
}

resource "aws_route" "internet_gateway" {
  for_each = toset(local.availability_zones)

  route_table_id         = aws_route_table.public_route_bastion[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

###################
# Private Subnets #
###################
resource "aws_subnet" "private_subnet_rest" {
  for_each = toset(local.availability_zones)

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false

  cidr_block        = cidrsubnet(local.cidr_block, 2, 2 + index(local.availability_zones, each.key))
  availability_zone = "${local.region}${each.key}"

  tags = merge(local.default_tags, {
    "Name" = format(module.namer.subnet, "rest", "pri", each.key)
  })
}

resource "aws_route_table_association" "private_route_rest" {
  for_each = toset(local.availability_zones)

  subnet_id      = aws_subnet.private_subnet_rest[each.key].id
  route_table_id = aws_route_table.private_route_rest[each.key].id
}

resource "aws_route_table" "private_route_rest" {
  for_each = toset(local.availability_zones)

  vpc_id = aws_vpc.this.id

  tags = merge(local.default_tags, {
    "Name" = format(module.namer.route_table, "rest", "pri", each.key)
  })
}

############
# Instance #
############
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "rest_auth" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_subnet_rest["c"].id

  tags = {
    Name = format(module.namer_with_additional_identifier_verb.ec2_instance, "rest", "auth")
  }
}
