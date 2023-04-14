provider "huaweicloud" {
  region = "ap-southeast-3"
}

module "vpc" {
  source  = "cloud-labs-infra/vpc/huaweicloud"
  version = "1.0.0"

  name = "dev01"
}

module "secgroup_rocketmq" {
  source  = "cloud-labs-infra/security-group/huaweicloud"
  version = "1.0.0"

  name         = "dev01"
  name_postfix = "postgres"

  rules = {
    "Egress Allow All" = {
      direction        = "egress"
      remote_ip_prefix = "0.0.0.0/0"
    },
    "Ingress Allow to the VPC" = {
      direction        = "ingress"
      remote_ip_prefix = module.vpc.vpc_cidr
    },
  }
}

module "rocketmq" {
  source  = "cloud-labs-infra/dms-rocketmq/huaweicloud"
  version = "1.0.0"

  name              = "dev01"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.private_subnets_ids[0]
  security_group_id = module.secgroup_rocketmq.id

  topics = {
    TST1 = {}
    TST2 = {
      queue_num            = 16
      total_read_queue_num = 6
    }
    TST3 = {
      brokers = ["broker-0"]
    }
  }
}
