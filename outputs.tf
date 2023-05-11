output "id" {
  description = "Specifies a resource ID in UUID format"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.id : null
}

output "status" {
  description = "Indicates the status of the DMS RocketMQ instance"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.status : null
}

output "type" {
  description = "Indicates the DMS RocketMQ instance type"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.type : null
}

output "specification" {
  description = "Indicates the instance specification"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.specification : null
}

output "node_num" {
  description = "Indicates the node quantity"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.node_num : null
}

output "broker_address" {
  description = "Indicates the service data address"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.broker_address : null
}

output "namesrv_address" {
  description = "Indicates the metadata address"
  value       = var.rocketmq_instance_id == null ? huaweicloud_dms_rocketmq_instance.main.0.namesrv_address : null
}
