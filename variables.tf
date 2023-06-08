variable "name" {
  description = "Specifies the name of the DMS RocketMQ instance"
  type        = string
}

variable "name_postfix" {
  description = "Specifies the name postfix of the DMS RocketMQ instance"
  type        = string
  default     = null
}

variable "description" {
  description = "Specifies the description of the DMS RocketMQ instance"
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the resource, if omitted, the provider-level region will be used"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "Specifies the ID of a VPC"
  type        = string
}

variable "subnet_id" {
  description = "Specifies the ID of a subnet"
  type        = string
}

variable "security_group_id" {
  description = "Specifies the ID of a security group"
  type        = string
}

variable "engine_version" {
  description = "Specifies the version of the RocketMQ engine"
  type        = string
  default     = "4.8.0"
  validation {
    condition     = contains(["4.8.0"], var.engine_version)
    error_message = "At the moment only '4.8.0' version is available."
  }
}

variable "storage_space" {
  description = "Specifies the message storage capacity, Unit: GB"
  type        = number
  default     = 300
  validation {
    condition     = 300 <= var.storage_space && var.storage_space <= 3000
    error_message = "Value range: 300-3000."
  }
}

variable "single_az" {
  description = <<DES
  All instances in the same availability zone.
  **The more AZs selected, the better the reliability and SLA coverage.**
  DES
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "Specifies the AZ name, if omitted, AZ calculates automatically"
  type        = list(string)
  default     = []
  validation {
    condition     = length(var.availability_zones) <= 1 || length(var.availability_zones) == 3
    error_message = "Specify one or three Availability Zones or keep it empty."
  }
}

variable "flavor_id" {
  description = <<DES
  Specifies the instance flavor id:
  `c6.4u8g.cluster.small`: maximum number of topics on each broker: 2000; maximum number of consumer groups on each broker: 2000
  `c6.4u8g.cluster`: maximum number of topics on each broker: 4000; maximum number of consumer groups on each broker: 4000
  `c6.8u16g.cluster`: maximum number of topics on each broker: 8000; maximum number of consumer groups on each broker: 8000
  `c6.12u24g.cluster`: maximum number of topics on each broker: 12,000; maximum number of consumer groups on each broker: 12,000
  `c6.16u32g.cluster`: maximum number of topics on each broker: 16,000; maximum number of consumer groups on each broker: 16,000 Changing this parameter will create a new resource.
  DES
  type        = string
  default     = "c6.4u8g.cluster.small"
  validation {
    condition     = contains(["c6.4u8g.cluster.small", "c6.4u8g.cluster", "c6.8u16g.cluster", "c6.12u24g.cluster", "c6.16u32g.cluster"], var.flavor_id)
    error_message = "The valid value are 'rocketmq.4u8g.cluster.small', 'rocketmq.4u8g.cluster', 'rocketmq.8u16g.cluster', 'c6.12u24g.cluster', 'c6.16u32g.cluster'."
  }
}

variable "storage_spec_code" {
  description = <<DES
  Specifies the storage I/O specification:
  * `dms.physical.storage.high.v2`: high I/O disk;
  * `dms.physical.storage.ultra.v2`: ultra-high I/O disk Changing this parameter will create a new resource.
  DES
  type        = string
  default     = "dms.physical.storage.high.v2"
  validation {
    condition     = contains(["dms.physical.storage.high.v2", "dms.physical.storage.ultra.v2"], var.storage_spec_code)
    error_message = "The valid value are 'dms.physical.storage.high.v2', 'dms.physical.storage.ultra.v2'."
  }
}

variable "ssl_enable" {
  description = "Specifies whether the RocketMQ SASL_SSL is enabled"
  type        = bool
  default     = false
}

variable "ipv6_enable" {
  description = "Specifies whether to support IPv6"
  type        = bool
  default     = false
}

variable "enable_publicip" {
  description = "Specifies whether to enable public access"
  type        = bool
  default     = false
}

variable "rocketmq_instance_id" {
  description = "Specifies the ID of Rocketmq instance, if it sets, Rocketmq instance won't be created"
  type        = string
  default     = null
}

variable "broker_num" {
  description = "Specifies the broker numbers"
  type        = number
  default     = 1
}

variable "enable_acl" {
  description = "Specifies whether access control is enabled"
  type        = bool
  default     = false
}

variable "topics" {
  description = <<DES
  RocketMQ topics configuration:
    * `key` - name of the topic;
    * `queue_num` - specifies the number of queues, default to 8;
    * `permission` - specifies the permissions of the topic, value options: `all`, `sub`, `pub`, default to `all`;
    * `total_read_queue_num` - Specifies the total number of read queues;
    * `total_write_queue_num` - Specifies the total number of write queues;
    * `brokers` - indicates the number of the brokers, !!! can't be more than `broker_num` variable.
  DES
  type = map(object({
    queue_num             = optional(number, 8)
    permission            = optional(string, "all")
    total_read_queue_num  = optional(number, 3)
    total_write_queue_num = optional(number, 3)
    brokers               = optional(list(string), ["broker-0"])
  }))
  default = {}
}

variable "consumer_groups" {
  description = <<DES
  RocketMQ Consumers groups:
    * `key` - name of the group;
    * `enabled` - specifies the consumer group is enabled or not;
    * `broadcast` - specifies whether to broadcast of the consumer group;
    * `brokers` - specifies the list of associated brokers of the consumer group;
    * `retry_max_times` - specifies the maximum number of retry times.
  DES
  type = map(object({
    enabled         = optional(bool, true)
    broadcast       = optional(bool, true)
    brokers         = optional(list(string), ["broker-0"])
    retry_max_times = optional(number, 3)
  }))
  default = {}
}

variable "tags" {
  description = "Specifies the key/value pairs to associate with the RocketMQ Instance"
  type        = map(string)
  default     = {}
}
