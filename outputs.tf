output "id" {
  description = "Specifies a resource ID in UUID format"
  value       = huaweicloud_dms_rocketmq_instance.main.id
}

output "status" {
  description = "Indicates the status of the DMS RocketMQ instance"
  value       = huaweicloud_dms_rocketmq_instance.main.status
}

output "type" {
  description = "Indicates the DMS RocketMQ instance type"
  value       = huaweicloud_dms_rocketmq_instance.main.type
}

output "specification" {
  description = "Indicates the instance specification"
  value       = huaweicloud_dms_rocketmq_instance.main.specification
}

output "node_num" {
  description = "Indicates the node quantity"
  value       = huaweicloud_dms_rocketmq_instance.main.node_num
}

output "broker_address" {
  description = "Indicates the service data address"
  value       = huaweicloud_dms_rocketmq_instance.main.broker_address
}

output "namesrv_address" {
  description = "Indicates the metadata address"
  value       = huaweicloud_dms_rocketmq_instance.main.namesrv_address
}
