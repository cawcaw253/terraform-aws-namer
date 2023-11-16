module "simple_network" {
  providers = {
    aws = "aws.ap-northeast-2"
  }

  source = "../../"

  prefix = ["project", "environment"]
}

output "simple_network" {
  value = {
    virtual_private_cloud = module.simple_network.virtual_private_cloud
    internet_gateway      = module.simple_network.internet_gateway
    elastic_ip = {
      for az in ["a", "c"] : az => format(module.simple_network.elastic_ip, az, "nat")
    }
    nat_gateway = {
      for az in ["a", "c"] : az => format(module.simple_network.nat_gateway, az)
    }
    private_subnet = {
      for id in ["rest", "database"] : id => {
        for az in ["a", "c"] : az => format(module.simple_network.subnet, az, id, "pri")
      }
    }
    public_subnet = {
      for id in ["bastion", "public"] : id => {
        for az in ["a", "c"] : az => format(module.simple_network.subnet, id, "pub", az)
      }
    }
    route_table = {
      for id in ["rest", "database"] : id => {
        for az in ["a", "c"] : az => format(module.simple_network.route_table, id, "pri", az)
      }
    }
  }
}
