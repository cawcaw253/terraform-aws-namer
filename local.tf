data "aws_region" "current" {}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

locals {
  region_name = data.aws_region.current.name
  region_code = lookup(local.region_code_map, local.region_name)
  region_code_map = {
    "us-east-1"      = "ue1"
    "us-east-2"      = "ue2"
    "us-west-1"      = "uw1"
    "us-west-2"      = "uw2"
    "ap-east-1"      = "ae1"
    "ap-south-1"     = "as1"
    "ap-northeast-1" = "an1"
    "ap-northeast-2" = "an2"
    "ap-northeast-3" = "an3"
    "ap-southeast-1" = "ase1"
    "ap-southeast-2" = "ase2"
    "ap-southeast-3" = "ase3"
    "ca-central-1"   = "cc1"
    "eu-central-1"   = "ec1"
    "eu-west-1"      = "ew1"
    "eu-west-2"      = "ew2"
    "eu-west-3"      = "ew3"
    "eu-south-1"     = "es1"
    "eu-north-1"     = "en1"
    "me-central-1"   = "mc1"
    "me-south-1"     = "ms1"
    "af-south-1"     = "afs1"
    "sa-east-1"      = "se1"
  }

  resource_name = {
    virtual_private_cloud         = "vpc"
    internet_gateway              = "igw"
    elastic_ip                    = "eip"
    nat_gateway                   = "nat"
    subnet                        = "snet"
    route_table                   = "rt"
    ec2_instance                  = "ec2"
    security_group                = "sgs"
    network_access_control_list   = "nacl"
    elastic_load_balancer         = "elb"
    classic_load_balancer         = "clb"
    network_load_balancer         = "nlb"
    application_load_balancer     = "alb"
    target_group                  = "tg"
    rds_cluster                   = "rds"
    rds_instance                  = "rds"
    rds_subnet_group              = "snetg"
    rds_parameter_group           = "pg"
    elasticache                   = "ec"
    elasticache_replication_group = "ecrg"
    elasticache_subnet_group      = "snetg"
    iam_role                      = "role"
    iam_policy                    = "policy"
    secrets_manager               = ""
    simple_queue_service          = "sqs"
    simple_email_service          = "ses"
    kinesis_data_stream           = "kds"
    eks_cluster                   = "eks"
    eks_node_group                = "eksn"
    transit_gateway               = "tgw"
    transit_gateway_attachment    = "tgwa"
    transit_gateway_route_table   = "tgwrtb"
    key_management_service        = "kms"
    # Need discuss about s3 naming conventions
    # s3_bucket                   = "s3"
  }
}
