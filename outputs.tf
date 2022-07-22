output "kubeconfig" {
  value       = huaweicloud_cce_cluster.mycce.kube_config_raw
  description = "kubeconfig"
}
output "lb_public_ip" {
  value       = toset(module.loadbalancer[*].lb_public_ip)
  description = "Public IP"
}
output "lb_id" {
  value       = toset(module.loadbalancer[*].lb_id)
  description = "LoadBalancer ID"
}
output "lb_subnet_id" {
  value       = toset(module.loadbalancer[*].lb_subnet_id)
  description = "LoadBalancer Subnet ID"
}
