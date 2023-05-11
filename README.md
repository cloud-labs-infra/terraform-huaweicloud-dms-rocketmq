# Huawei Cloud DMS RocketMQ

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_dms_rocketmq_consumer_group.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dms_rocketmq_consumer_group) | resource |
| [huaweicloud_dms_rocketmq_instance.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dms_rocketmq_instance) | resource |
| [huaweicloud_dms_rocketmq_topic.main](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/dms_rocketmq_topic) | resource |
| [huaweicloud_availability_zones.zones](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Specifies the AZ name, if omitted, AZ calculates automatically | `list(string)` | `[]` | no |
| <a name="input_broker_num"></a> [broker\_num](#input\_broker\_num) | Specifies the broker numbers | `number` | `1` | no |
| <a name="input_consumer_groups"></a> [consumer\_groups](#input\_consumer\_groups) | RocketMQ Consumers groups:<br>    * `key` - name of the group;<br>    * `enabled` - specifies the consumer group is enabled or not;<br>    * `broadcast` - specifies whether to broadcast of the consumer group;<br>    * `brokers` - specifies the list of associated brokers of the consumer group;<br>    * `retry_max_times` - specifies the maximum number of retry times. | <pre>map(object({<br>    enabled         = optional(bool, true)<br>    broadcast       = optional(bool, true)<br>    brokers         = optional(list(string), ["broker-0"])<br>    retry_max_times = optional(number, 3)<br>  }))</pre> | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Specifies the description of the DMS RocketMQ instance | `string` | `null` | no |
| <a name="input_enable_acl"></a> [enable\_acl](#input\_enable\_acl) | Specifies whether access control is enabled | `bool` | `false` | no |
| <a name="input_enable_publicip"></a> [enable\_publicip](#input\_enable\_publicip) | Specifies whether to enable public access | `bool` | `false` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Specifies the version of the RocketMQ engine | `string` | `"4.8.0"` | no |
| <a name="input_flavor_id"></a> [flavor\_id](#input\_flavor\_id) | Specifies the instance flavor id:<br>  `c6.4u8g.cluster.small`: maximum number of topics on each broker: 2000; maximum number of consumer groups on each broker: 2000<br>  `c6.4u8g.cluster`: maximum number of topics on each broker: 4000; maximum number of consumer groups on each broker: 4000<br>  `c6.8u16g.cluster`: maximum number of topics on each broker: 8000; maximum number of consumer groups on each broker: 8000<br>  `c6.12u24g.cluster`: maximum number of topics on each broker: 12,000; maximum number of consumer groups on each broker: 12,000<br>  `c6.16u32g.cluster`: maximum number of topics on each broker: 16,000; maximum number of consumer groups on each broker: 16,000 Changing this parameter will create a new resource. | `string` | `"c6.4u8g.cluster.small"` | no |
| <a name="input_ipv6_enable"></a> [ipv6\_enable](#input\_ipv6\_enable) | Specifies whether to support IPv6 | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the DMS RocketMQ instance | `string` | n/a | yes |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | Specifies the name postfix of the DMS RocketMQ instance | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the resource, if omitted, the provider-level region will be used | `string` | `null` | no |
| <a name="input_rocketmq_instance_id"></a> [rocketmq\_instance\_id](#input\_rocketmq\_instance\_id) | Specifies the ID of Rocketmq instance, if it sets, Rocketmq instance won't be created | `string` | `null` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Specifies the ID of a security group | `string` | n/a | yes |
| <a name="input_single_az"></a> [single\_az](#input\_single\_az) | All instances in the same availability zone.<br>  **The more AZs selected, the better the reliability and SLA coverage.** | `bool` | `false` | no |
| <a name="input_ssl_enable"></a> [ssl\_enable](#input\_ssl\_enable) | Specifies whether the RocketMQ SASL\_SSL is enabled | `bool` | `false` | no |
| <a name="input_storage_space"></a> [storage\_space](#input\_storage\_space) | Specifies the message storage capacity, Unit: GB | `number` | `300` | no |
| <a name="input_storage_spec_code"></a> [storage\_spec\_code](#input\_storage\_spec\_code) | Specifies the storage I/O specification:<br>  * `dms.physical.storage.high.v2`: high I/O disk;<br>  * `dms.physical.storage.ultra.v2`: ultra-high I/O disk Changing this parameter will create a new resource. | `string` | `"dms.physical.storage.high.v2"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the ID of a subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Specifies the key/value pairs to associate with the RocketMQ Instance | `map(string)` | `{}` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | RocketMQ topics configuration:<br>    * `key` - name of the topic;<br>    * `queue_num` - specifies the number of queues, default to 8;<br>    * `permission` - specifies the permissions of the topic, value options: `all`, `sub`, `pub`, default to `all`;<br>    * `total_read_queue_num` - Specifies the total number of read queues;<br>    * `total_write_queue_num` - Specifies the total number of write queues;<br>    * `brokers` - indicates the number of the brokers, !!! can't be more than `broker_num` variable. | <pre>map(object({<br>    queue_num             = optional(number, 8)<br>    permission            = optional(string, "all")<br>    total_read_queue_num  = optional(number, null)<br>    total_write_queue_num = optional(number, null)<br>    brokers               = optional(list(string), ["broker-0"])<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Specifies the ID of a VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_broker_address"></a> [broker\_address](#output\_broker\_address) | Indicates the service data address |
| <a name="output_id"></a> [id](#output\_id) | Specifies a resource ID in UUID format |
| <a name="output_namesrv_address"></a> [namesrv\_address](#output\_namesrv\_address) | Indicates the metadata address |
| <a name="output_node_num"></a> [node\_num](#output\_node\_num) | Indicates the node quantity |
| <a name="output_specification"></a> [specification](#output\_specification) | Indicates the instance specification |
| <a name="output_status"></a> [status](#output\_status) | Indicates the status of the DMS RocketMQ instance |
| <a name="output_type"></a> [type](#output\_type) | Indicates the DMS RocketMQ instance type |
<!-- END_TF_DOCS -->