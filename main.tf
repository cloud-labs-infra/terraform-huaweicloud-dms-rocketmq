data "huaweicloud_availability_zones" "zones" {
  region = var.region
}


locals {
  name               = var.rocketmq_instance_id == null ? (var.name_postfix == null ? format("%s-rocketmq", var.name) : format("%s-rocketmq-%s", var.name, var.name_postfix)) : null
  availability_zones = var.rocketmq_instance_id == null ? length(var.availability_zones) == 0 ? slice(data.huaweicloud_availability_zones.zones.names, 0, var.single_az ? 1 : 3) : var.availability_zones : null
}


resource "huaweicloud_dms_rocketmq_instance" "main" {
  count = var.rocketmq_instance_id == null ? 1 : 0

  name               = local.name
  description        = var.description
  region             = var.region
  engine_version     = var.engine_version
  storage_space      = var.storage_space
  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  security_group_id  = var.security_group_id
  availability_zones = local.availability_zones
  flavor_id          = var.flavor_id
  storage_spec_code  = var.storage_spec_code
  ssl_enable         = var.ssl_enable
  ipv6_enable        = var.ipv6_enable
  enable_publicip    = var.enable_publicip
  broker_num         = var.broker_num
  enable_acl         = var.enable_acl

  tags = var.tags
}


resource "huaweicloud_dms_rocketmq_topic" "main" {
  for_each = var.topics

  instance_id           = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.id : var.rocketmq_instance_id
  name                  = each.key
  region                = var.region
  queue_num             = each.value.queue_num
  permission            = each.value.permission
  total_write_queue_num = each.value.total_write_queue_num
  total_read_queue_num  = each.value.total_read_queue_num

  dynamic "brokers" {
    for_each = each.value.brokers
    content {
      name = brokers.value
    }
  }
}


resource "huaweicloud_dms_rocketmq_consumer_group" "main" {
  for_each = var.consumer_groups

  instance_id     = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.id : var.rocketmq_instance_id
  name            = each.key
  region          = var.region
  enabled         = each.value.enabled
  broadcast       = each.value.broadcast
  brokers         = each.value.brokers
  retry_max_times = each.value.retry_max_times
}


moved {
  from = huaweicloud_dms_rocketmq_instance.main
  to   = huaweicloud_dms_rocketmq_instance.main.0
}
