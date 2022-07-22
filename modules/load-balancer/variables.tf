variable "cluster_name" {
  type        = string
  description = "Cluster Name"
}
variable "vpc_id" {
  type        = string
  description = "VPC id"
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
