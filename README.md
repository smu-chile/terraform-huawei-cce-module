## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0.6 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~> 1.26.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~> 1.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_cce_cluster.mycce](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_cluster) | resource |
| [huaweicloud_cce_node.mynode](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_node) | resource |
| [huaweicloud_compute_keypair.cce-node](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/compute_keypair) | resource |
| [huaweicloud_lb_loadbalancer.loadbalancer](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/lb_loadbalancer) | resource |
| [huaweicloud_networking_eip_associate.eip_1](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/networking_eip_associate) | resource |
| [huaweicloud_vpc_eip.eip-lb](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/vpc_eip) | resource |
| [huaweicloud_availability_zones.myaz](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/availability_zones) | data source |
| [huaweicloud_compute_flavors.flavors](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/compute_flavors) | data source |
| [huaweicloud_vpc_subnet.subnet](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cce_cluster_flavor_id"></a> [cce\_cluster\_flavor\_id](#input\_cce\_cluster\_flavor\_id) | Huawei CCE Cluster Flavor id | `string` | `"cce.s1.small"` | no |
| <a name="input_cce_node_cpu_core_count"></a> [cce\_node\_cpu\_core\_count](#input\_cce\_node\_cpu\_core\_count) | Core Quantity | `string` | `"4"` | no |
| <a name="input_cce_node_data_size"></a> [cce\_node\_data\_size](#input\_cce\_node\_data\_size) | Partition Size Data | `string` | `"100"` | no |
| <a name="input_cce_node_flavor_id"></a> [cce\_node\_flavor\_id](#input\_cce\_node\_flavor\_id) | Huawei Instance flavor Id | `string` | `"s3.large.4"` | no |
| <a name="input_cce_node_memory_size"></a> [cce\_node\_memory\_size](#input\_cce\_node\_memory\_size) | RAM | `string` | `"8"` | no |
| <a name="input_cce_node_root_size"></a> [cce\_node\_root\_size](#input\_cce\_node\_root\_size) | Root partition size | `string` | `"100"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster Name | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubernetes Version | `string` | `"v1.19.8-r1"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | tags by default | `any` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Node Count | `number` | `3` | no |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | Network ID de subnet | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | SSH Public Key | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | Network ID de subnet | `string` | n/a | yes |
| <a name="input_volumetype"></a> [volumetype](#input\_volumetype) | Volume Type, SATA o SSD | `string` | `"SSD"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | n/a |
| <a name="output_lb_public_ip"></a> [lb\_public\_ip](#output\_lb\_public\_ip) | n/a |
| <a name="output_lb_subnet_id"></a> [lb\_subnet\_id](#output\_lb\_subnet\_id) | n/a |