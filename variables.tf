variable "cluster_name" {
  type        = string
  description = "Cluster Name"
}
variable "cce_cluster_flavor_id" {
  type        = string
  description = "Huawei CCE Cluster Flavor id"
}
variable "cce_node_flavor_id" {
  type        = string
  description = "Huawei CCE Nodes Flavor id"
}
variable "cce_node_data_size" {
  type        = string
  description = "Partition Size Data"
}
variable "cce_node_root_size" {
  type        = string
  description = "Root partition size"
}
variable "private_subnet_id" {
  type        = string
  description = "Network ID de subnet"
}
variable "vpc_id" {
  type        = string
  description = "VPC id"
}
variable "cluster_version" {
  type        = string
  description = "Kubernetes Version"
}
variable "node_count" {
  type        = number
  description = "Node Count"
}
variable "volumetype" {
  type        = string
  description = "Volume Type, SATA o SSD"
}
variable "public_key" {
  type        = string
  description = "SSH Public Key"
}
variable "default_tags" {
  type        = map(any)
  description = "Tags by default"
}
variable "lb_bandwidth_size" {
  type        = number
  description = "loadbalancer bandwidth size"
}
variable "lb_share_type" {
  type        = string
  description = "loadbalancer share type"
}
variable "lb_charge_mode" {
  type        = string
  description = "loadbalancer charge mode traffic or bandwidth"
}
variable "lb_max_connections" {
  type        = number
  description = "loadbalancer layer 4 max connections"
}

# Add to Inputs
variable "container_network_type" {
  type        = string
  description = "The container network type: overlay_l2, underlay_ipvlan, vpc-router or eni"
}
variable "authentication_mode" {
  type        = string
  description = "The authentication mode of the cluster, possible values are x509 and rbac. Defaults to rbac"
}
variable "kube_proxy_mode" {
  type        = string
  description = "Specifies the service forwarding mode"
}