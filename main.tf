locals {
  prefix                     = join(var.delimiter, compact(var.prefix))
  main_identifier_verb       = "%s"
  sub_identifier_verb        = "%s"
  region                     = local.region_code
  region_with_az_verb        = "${local.region_code}%s"
  additional_identifier_verb = var.with_additional_identifier_verb ? "%s" : ""
  optional_verb              = try(coalesce(local.additional_identifier_verb), null)

  aws = {
    virtual_private_cloud = {
      name = join(var.delimiter, compact([
        local.resource_name.virtual_private_cloud,
        local.prefix,
        local.region,
        local.optional_verb,
      ]))
    }
    internet_gateway = {
      name = join(var.delimiter, compact([
        local.resource_name.internet_gateway,
        local.prefix,
        local.region,
        local.optional_verb,
      ]))
    }
    elastic_ip = {
      name = join(var.delimiter, compact([
        local.resource_name.elastic_ip,
        local.prefix,
        local.region_with_az_verb,
        local.main_identifier_verb, // identifier
        local.optional_verb,
      ]))
    }
    nat_gateway = {
      name = join(var.delimiter, compact([
        local.resource_name.nat_gateway,
        local.prefix,
        local.region_with_az_verb,
        local.optional_verb,
      ]))
    }
    subnet = {
      name = join(var.delimiter, compact([
        local.resource_name.subnet,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.sub_identifier_verb,  // route type
        local.region_with_az_verb,
        local.optional_verb,
      ]))
    }
    route_table = {
      name = join(var.delimiter, compact([
        local.resource_name.route_table,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.sub_identifier_verb,  // route type
        local.region_with_az_verb,
        local.optional_verb,
      ]))
    }
    ec2_instance = {
      name = join(var.delimiter, compact([
        local.resource_name.ec2_instance,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    security_group = {
      name = join(var.delimiter, compact([
        local.resource_name.security_group,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.sub_identifier_verb,  // resource type
        local.region,
        local.optional_verb,
      ]))
    }
    network_access_control_list = {
      name = join(var.delimiter, compact([
        local.resource_name.network_access_control_list,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    elastic_load_balancer = {
      name = join(var.delimiter, compact([
        local.resource_name.elastic_load_balancer,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    classic_load_balancer = {
      name = join(var.delimiter, compact([
        local.resource_name.classic_load_balancer,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    network_load_balancer = {
      name = join(var.delimiter, compact([
        local.resource_name.network_load_balancer,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    application_load_balancer = {
      name = join(var.delimiter, compact([
        local.resource_name.application_load_balancer,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    target_group = {
      name = join(var.delimiter, compact([
        local.resource_name.target_group,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    rds_cluster = {
      name = join(var.delimiter, compact([
        local.resource_name.rds_cluster,
        local.prefix,
        local.main_identifier_verb, // database type
        local.region,
        local.optional_verb,
      ]))
    }
    rds_instance = {
      name = join(var.delimiter, compact([
        local.resource_name.rds_instance,
        local.prefix,
        local.main_identifier_verb, // database type
        local.region,
        local.optional_verb,
      ]))
    }
    rds_subnet_group = {
      name = join(var.delimiter, compact([
        local.resource_name.rds_subnet_group,
        local.prefix,
        local.main_identifier_verb, // database type
        local.region,
        local.optional_verb,
      ]))
    }
    rds_parameter_group = {
      name = join(var.delimiter, compact([
        local.resource_name.rds_parameter_group,
        local.prefix,
        local.main_identifier_verb, // database type
        local.region,
        local.optional_verb,
      ]))
    }
    elasticache = {
      name = join(var.delimiter, compact([
        local.resource_name.elasticache,
        local.prefix,
        local.main_identifier_verb,
        local.region,
        local.optional_verb,
      ]))
    }
    elasticache_replication_group = {
      name = join(var.delimiter, compact([
        local.resource_name.elasticache_replication_group,
        local.prefix,
        local.main_identifier_verb,
        local.region,
        local.optional_verb,
      ]))
    }
    elasticache_subnet_group = {
      name = join(var.delimiter, compact([
        local.resource_name.elasticache_subnet_group,
        local.prefix,
        local.main_identifier_verb,
        local.region,
        local.optional_verb,
      ]))
    }
    iam_role = {
      name = join(var.delimiter, compact([
        local.resource_name.iam_role,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.sub_identifier_verb,  // resource type
        local.optional_verb,
      ]))
    }
    iam_policy = {
      name = join(var.delimiter, compact([
        local.resource_name.iam_policy,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.sub_identifier_verb,  // resource type
        local.optional_verb,
      ]))
    }
    secrets_manager = {
      name = join(var.delimiter, compact([
        local.resource_name.secrets_manager,
        local.prefix,
        local.region,
        local.main_identifier_verb, // identifier
      ]))
    }
    simple_queue_service = {
      name = join(var.delimiter, compact([
        local.resource_name.simple_queue_service,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    simple_email_service = {
      name = join(var.delimiter, compact([
        local.resource_name.simple_email_service,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    kinesis_data_stream = {
      name = join(var.delimiter, compact([
        local.resource_name.kinesis_data_stream,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    eks_cluster = {
      name = join(var.delimiter, compact([
        local.resource_name.eks_cluster,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    eks_node_group = {
      name = join(var.delimiter, compact([
        local.resource_name.eks_node_group,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    transit_gateway = {
      name = join(var.delimiter, compact([
        local.resource_name.transit_gateway,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    transit_gateway_attachment = {
      name = join(var.delimiter, compact([
        local.resource_name.transit_gateway_attachment,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    transit_gateway_route_table = {
      name = join(var.delimiter, compact([
        local.resource_name.transit_gateway_route_table,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
    key_management_service = {
      name = join(var.delimiter, compact([
        local.resource_name.key_management_service,
        local.prefix,
        local.main_identifier_verb, // identifier
        local.region,
        local.optional_verb,
      ]))
    }
  }
}
