variable "cluster_name" {
  type        = string
  description = "Cluster Name"
}
variable "cce_cluster_flavor_id" {
  type        = string
  default     = "cce.s1.small"
  description = "Huawei CCE Cluster Flavor id"
}

variable "cce_cluster_flavor_id" {
  type        = string
  default     = "s3.xlarge.4"
  description = "Huawei CCE Nodes Flavor id"
}

variable "cce_node_data_size" {
  type        = string
  default     = "100"
  description = "Partition Size Data"
}

variable "private_subnet_id" {
  type        = string
  description = "Network ID de subnet"
}

variable "public_subnet_id" {
  type        = string
  description = "Network ID de subnet"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "cluster_version" {
  type        = string
  default     = "v1.19.8-r1"
  description = "Kubernetes Version"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "Node Count"
}

variable "volumetype" {
  type        = string
  default     = "SSD"
  description = "Volume Type, SATA o SSD"
}

variable "public_key" {
  type        = string
  description = "SSH Public Key"
}

variable "default_tags" {
  description = "tags by default"
}