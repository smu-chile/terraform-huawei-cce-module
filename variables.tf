variable "cluster_name" {
  type        = string
  description = "Cluster Name"
}
variable "cce_cluster_flavor_id" {
  type        = string
  default     = "cce.s1.small"
  description = "Huawei CCE Cluster Flavor id"
}

variable "cce_node_flavor_id" {
  type        = string
  default     = "s3.xlarge.4"
  description = "Huawei CCE Nodes Flavor id"
}

variable "cce_node_data_size" {
  type        = string
  default     = "100"
  description = "Partition Size Data"
}

variable "cce_node_root_size" {
  type        = string
  default     = "100"
  description = "Root partition size"
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

variable "lb_bandwidth_size" {
  type        = number
  description = "loadbalancer bandwidth size"
  default     = 50
}

variable "lb_share_type" {
  type        = string
  description = "loadbalancer share type"
  default     = "PER"
}

variable "lb_charge_mode" {
  type        = string
  description = "loadbalancer charge mode traffic or bandwidth"
  default     = "traffic"
}

variable "lb_max_connections" {
  type        = number
  description = "loadbalancer layer 4 max connections"
  default     = 1000000
}

variable "container_network_type" {
  type        = string
  description = "CCE Cluster container network type"
  default     = "vpc-router"
}

variable "authentication_mode" {
  type        = string
  description = "Specifies the authentication mode of the cluster, possible values are rbac and authenticating_proxy. Defaults to rbac. Changing this parameter will create a new cluster resource."
  default     = "vpc-router"
}

variable "kube_proxy_mode" {
  type        = string
  description = "Specifies the service forwarding mode. Changing this parameter will create a new cluster resource. Two modes are available: iptables: Traditional kube-proxy uses iptables rules to implement service load balancing. In this mode, too many iptables rules will be generated when many services are deployed. In addition, non-incremental updates will cause a latency and even obvious performance issues in the case of heavy service traffic. ipvs: Optimized kube-proxy mode with higher throughput and faster speed. This mode supports incremental updates and can keep connections uninterrupted during service updates. It is suitable for large-sized clusters."
  default     = "vpc-router"
}

# Second Loadbalancer

variable "lb_max_connections_two" {
  type        = number
  description = "Second loadbalancer layer 4 max connections"
  default     = 1000000
}

variable "lb_share_type_two" {
  type        = string
  description = "Second loadbalancer share type"
  default     = "PER"
}

variable "lb_charge_mode_two" {
  type        = string
  description = "Second loadbalancer charge mode traffic or bandwidth"
  default     = "traffic"
}

variable "lb_max_connections_two" {
  type        = number
  description = "Second loadbalancer layer 4 max connections"
  default     = 1000000
}