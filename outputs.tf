
output "virtual_private_cloud" {
  value       = local.aws.virtual_private_cloud.name
  description = <<EOF
Virtual Private Cloud

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    vpc-project-env-an2
  usage :
    module.namer.virtual_private_cloud
EOF
}

output "internet_gateway" {
  value       = local.aws.internet_gateway.name
  description = <<EOF
Internet Gateway

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    igw-project-env-an2
  usage :
    module.namer.internet_gateway
EOF
}

output "elastic_ip" {
  value       = local.aws.elastic_ip.name
  description = <<EOF
Elastic IP Address

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    eip-project-env-an2%s-%s
  usage :
    format(module.namer.elastic_ip, "az_value", "identifier")
EOF
}

output "nat_gateway" {
  value       = local.aws.nat_gateway.name
  description = <<EOF
NAT Gateway

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    nat-project-env-an2%s
  usage :
    format(module.namer.nat_gateway, "az_value")
EOF
}

output "subnet" {
  value       = local.aws.subnet.name
  description = <<EOF
Subnet

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    snet-project-env-%s-%s-an2%s
  usage :
    format(module.namer.subnet, "identifier", "subnet_type [pri, pub]", "az_value")
EOF
}

output "route_table" {
  value       = local.aws.route_table.name
  description = <<EOF
Route Table

Example :
  setting :
    region = ap-northeast-2
    delimiter = "-"
    prefix = ["project", "env"]
    additional_identifier_verb = false // if true, please check examples/complete
  result :
    rt-project-env-%s-%s-an2%s
  usage :
    format(module.namer.route_table, "identifier", "subnet_type [pri, pub]", "az_value")
EOF
}

output "ec2_instance" {
  value       = local.aws.ec2_instance.name
  description = <<EOF
EC2 Instance
EOF
}

output "security_group" {
  value       = local.aws.security_group.name
  description = <<EOF
Security Group
EOF
}

output "network_access_control_list" {
  value       = local.aws.network_access_control_list.name
  description = <<EOF
Network Access Control List
EOF
}

output "elastic_load_balancer" {
  value       = local.aws.elastic_load_balancer.name
  description = <<EOF
Elastic Load Balancer
EOF
}

output "classic_load_balancer" {
  value       = local.aws.classic_load_balancer.name
  description = <<EOF
Classic Load Balancer
EOF
}

output "network_load_balancer" {
  value       = local.aws.network_load_balancer.name
  description = <<EOF
Network Load Balancer
EOF
}

output "application_load_balancer" {
  value       = local.aws.application_load_balancer.name
  description = <<EOF
Application Load Balancer
EOF
}

output "target_group" {
  value       = local.aws.target_group.name
  description = <<EOF
Target Group
EOF
}

output "rds_cluster" {
  value       = local.aws.rds_cluster.name
  description = <<EOF
RDS Cluster
EOF
}

output "rds_instance" {
  value       = local.aws.rds_instance.name
  description = <<EOF
RDS Instance
EOF
}

output "rds_subnet_group" {
  value       = local.aws.rds_subnet_group.name
  description = <<EOF
RDS Subnet Group
EOF
}

output "rds_parameter_group" {
  value       = local.aws.rds_parameter_group.name
  description = <<EOF
RDS Parameter Group
EOF
}

output "elasticache" {
  value       = local.aws.elasticache.name
  description = <<EOF
Elasticache
EOF
}

output "elasticache_replication_group" {
  value       = local.aws.elasticache_replication_group.name
  description = <<EOF
Elasticache Replication Group
EOF
}

output "elasticache_subnet_group" {
  value       = local.aws.elasticache_subnet_group.name
  description = <<EOF
Elasticache Subnet Group
EOF
}

output "iam_role" {
  value       = local.aws.iam_role.name
  description = <<EOF
IAM Role
EOF
}

output "iam_policy" {
  value       = local.aws.iam_policy.name
  description = <<EOF
IAM Policy
EOF
}

output "secrets_manager" {
  value       = local.aws.secrets_manager.name
  description = <<EOF
Secrets Manager
EOF
}

output "simple_queue_service" {
  value       = local.aws.simple_queue_service.name
  description = <<EOF
Simple Queue Service
EOF
}

output "simple_email_service" {
  value       = local.aws.simple_email_service.name
  description = <<EOF
Simple Email Service
EOF
}

output "kinesis_data_stream" {
  value       = local.aws.kinesis_data_stream.name
  description = <<EOF
Kinesis Data Stream
EOF
}

output "eks_cluster" {
  value       = local.aws.eks_cluster.name
  description = <<EOF
EKS Cluster
EOF
}

output "eks_node_group" {
  value       = local.aws.eks_node_group.name
  description = <<EOF
EKS Node Group
EOF
}

output "transit_gateway" {
  value       = local.aws.transit_gateway.name
  description = <<EOF
Transit Gateway
EOF
}

output "transit_gateway_attachment" {
  value       = local.aws.transit_gateway_attachment.name
  description = <<EOF
Transit Gateway Attachment
EOF
}

output "transit_gateway_route_table" {
  value       = local.aws.transit_gateway_route_table.name
  description = <<EOF
Transit Gateway Route Table
EOF
}

output "key_management_service" {
  value       = local.aws.key_management_service.name
  description = <<EOF
Key Management Service
EOF
}
