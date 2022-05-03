output "kubeconfig" {
  value = huaweicloud_cce_cluster.mycce.kube_config_raw
}

# output "lb_public_ip" {
#   value = huaweicloud_networking_eip_associate.eip_1.public_ip
# }

# output "lb_id" {
#   value = huaweicloud_lb_loadbalancer.loadbalancer.id
# }

# output "lb_subnet_id" {
#   value = huaweicloud_lb_loadbalancer.loadbalancer.vip_subnet_id
# }
