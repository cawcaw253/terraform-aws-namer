# AWS Namer Terraform module

Terraform module which creates name format for AWS resources

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)


This module is to help you create resources in AWS using Terrafom to create names according to the rules.
Please refer to [Examples](./examples/) for examples of usage.
In the following, I will explain the usage and structure in a simple way.

## Usage

```hcl
module "namer" {
  source = "../../"

  prefix = ["namer", "prod"]
}

module "namer_with_additional_identifier_verb" {
  source = "../../"

  with_additional_identifier_verb = true
  prefix                          = ["namer", "prod"]
}

...
"Name" = format(module.namer.subnet, "bastion", "pub", each.key)

...
"Name" = format(module.namer_with_additional_identifier_verb.ec2_instance, "rest", "auth")
```

## Outputs

The overall output should look something like this

```hcl
# delimiter = "-"
# Default
${resource_name}-${prefix}-${identifier}

# With Optional Resource Number
# with_additional_identifier_verb = true
${resource_name}-${prefix}-${identifier}-${additional_identifier}
```

We'll discuss each element in more detail below.

### resource_name

This element is the name of the resource provided by AWS.

This module uses abbreviated resource names, which can be found and changed in [local.tf] (./local.tf).

### prefix

This element is a user-definable prefix value and can provide multiple values in an array.

```hcl
# delimiter = "-"
# ["poc", "dev"]
prefix = "poc-dev"

# ["terraform", "prod"]
prefix = "terraform-prod"
```

### identifier

This element is an identifier, with one or two arguments.

  ex) `${service_name}`, `${subnet_name}-${route_type}` 

You can see how many arguments it has in [outputs.tf] (./outputs.tf).

### additional_identifier (optional)

This is an optionally available element, enabled by adding the `with_additional_identifier_verb = true` option.

This is an identifier to use when you need to create multiple resources with the same name.
If this is not the case, we recommend not using it.

Below shows the result of adding this option when getting the name of an ec2_instance.
```hcl
# delimiter = "-"
# prefix = ["terraform", "qa"]
# identifier = ["rest"]
# region = "ap-northeast-2"
# with_additional_identifier_verb = true
-> ec2-terraform-qa-rest-an2-%s
```

For more usage examples, see [examples/complete/](./examples/complete/).

## Examples

- [Complete](https://github.com/cawcaw253/terraform-aws-namer/tree/main/examples/complete)
- [Simple](https://github.com/cawcaw253/terraform-aws-namer/tree/main/examples/simple)

## Terraform Docs

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | A delimiter variable that combines each element. | `string` | `"-"` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | A identifier value of the form `{resource_name} {prefix} {identifier} {sufix}`, where the listed values are combined into a `delimiter` variable. | `list(string)` | `[]` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix value of the form `{resource_name} {prefix} {identifier} {sufix}`, where the listed values are combined into a `delimiter` variable. | `list(string)` | <pre>[<br>  "project",<br>  "environment"<br>]</pre> | no |
| <a name="input_with_additional_identifier_verb"></a> [with\_additional\_identifier\_verb](#input\_with\_additional\_identifier\_verb) | If this value is false, naming doesn't contain additional identifier suffix. | `bool` | `false` | no |
| <a name="input_with_random_string"></a> [with\_random\_string](#input\_with\_random\_string) | n/a | `bool` | `false` | no |
| <a name="input_with_resource_number_verb"></a> [with\_resource\_number\_verb](#input\_with\_resource\_number\_verb) | If this value is false, naming doesn't contain number suffix. | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_load_balancer"></a> [application\_load\_balancer](#output\_application\_load\_balancer) | Application Load Balancer |
| <a name="output_classic_load_balancer"></a> [classic\_load\_balancer](#output\_classic\_load\_balancer) | Classic Load Balancer |
| <a name="output_ec2_instance"></a> [ec2\_instance](#output\_ec2\_instance) | EC2 Instance |
| <a name="output_eks_cluster"></a> [eks\_cluster](#output\_eks\_cluster) | EKS Cluster |
| <a name="output_eks_node_group"></a> [eks\_node\_group](#output\_eks\_node\_group) | EKS Node Group |
| <a name="output_elastic_ip"></a> [elastic\_ip](#output\_elastic\_ip) | Elastic IP Address<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    eip-project-env-an2%s-%s<br>  usage :<br>    format(module.namer.elastic\_ip, "az\_value", "identifier") |
| <a name="output_elastic_load_balancer"></a> [elastic\_load\_balancer](#output\_elastic\_load\_balancer) | Elastic Load Balancer |
| <a name="output_elasticache"></a> [elasticache](#output\_elasticache) | Elasticache |
| <a name="output_elasticache_replication_group"></a> [elasticache\_replication\_group](#output\_elasticache\_replication\_group) | Elasticache Replication Group |
| <a name="output_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#output\_elasticache\_subnet\_group) | Elasticache Subnet Group |
| <a name="output_iam_policy"></a> [iam\_policy](#output\_iam\_policy) | IAM Policy |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | IAM Role |
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | Internet Gateway<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    igw-project-env-an2<br>  usage :<br>    module.namer.internet\_gateway |
| <a name="output_key_management_service"></a> [key\_management\_service](#output\_key\_management\_service) | Key Management Service |
| <a name="output_kinesis_data_stream"></a> [kinesis\_data\_stream](#output\_kinesis\_data\_stream) | Kinesis Data Stream |
| <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway) | NAT Gateway<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    nat-project-env-an2%s<br>  usage :<br>    format(module.namer.nat\_gateway, "az\_value") |
| <a name="output_network_access_control_list"></a> [network\_access\_control\_list](#output\_network\_access\_control\_list) | Network Access Control List |
| <a name="output_network_load_balancer"></a> [network\_load\_balancer](#output\_network\_load\_balancer) | Network Load Balancer |
| <a name="output_rds_cluster"></a> [rds\_cluster](#output\_rds\_cluster) | RDS Cluster |
| <a name="output_rds_instance"></a> [rds\_instance](#output\_rds\_instance) | RDS Instance |
| <a name="output_rds_parameter_group"></a> [rds\_parameter\_group](#output\_rds\_parameter\_group) | RDS Parameter Group |
| <a name="output_rds_subnet_group"></a> [rds\_subnet\_group](#output\_rds\_subnet\_group) | RDS Subnet Group |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | Route Table<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    rt-project-env-%s-%s-an2%s<br>  usage :<br>    format(module.namer.route\_table, "identifier", "subnet\_type [pri, pub]", "az\_value") |
| <a name="output_secrets_manager"></a> [secrets\_manager](#output\_secrets\_manager) | Secrets Manager |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Security Group |
| <a name="output_simple_email_service"></a> [simple\_email\_service](#output\_simple\_email\_service) | Simple Email Service |
| <a name="output_simple_queue_service"></a> [simple\_queue\_service](#output\_simple\_queue\_service) | Simple Queue Service |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Subnet<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    snet-project-env-%s-%s-an2%s<br>  usage :<br>    format(module.namer.subnet, "identifier", "subnet\_type [pri, pub]", "az\_value") |
| <a name="output_target_group"></a> [target\_group](#output\_target\_group) | Target Group |
| <a name="output_transit_gateway"></a> [transit\_gateway](#output\_transit\_gateway) | Transit Gateway |
| <a name="output_transit_gateway_attachment"></a> [transit\_gateway\_attachment](#output\_transit\_gateway\_attachment) | Transit Gateway Attachment |
| <a name="output_transit_gateway_route_table"></a> [transit\_gateway\_route\_table](#output\_transit\_gateway\_route\_table) | Transit Gateway Route Table |
| <a name="output_virtual_private_cloud"></a> [virtual\_private\_cloud](#output\_virtual\_private\_cloud) | Virtual Private Cloud<br><br>Example :<br>  setting :<br>    region = ap-northeast-2<br>    delimiter = "-"<br>    prefix = ["project", "env"]<br>    with\_resource\_number\_verb = false // if true, please check examples/with-resource-number-verb<br>  result :<br>    vpc-project-env-an2<br>  usage :<br>    module.namer.virtual\_private\_cloud |
