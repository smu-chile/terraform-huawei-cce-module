output "kubeconfig" {
  value = huaweicloud_cce_cluster.mycce.kube_config_raw
  description = "kubeconfig"
}

output "lb_public_ip" {
  value = huaweicloud_vpc_eip.eip_lb.address
  description = "Public IP"
}

output "lb_id" {
  value = huaweicloud_elb_loadbalancer.loadbalancer.id
  description = "LoadBalancer ID"
}

output "lb_subnet_id" {
  value = huaweicloud_elb_loadbalancer.loadbalancer.ipv4_subnet_id
  description = "LoadBalancer Subnet ID"
}


