output "kubeconfig" {
  value = huaweicloud_cce_cluster.mycce.kube_config_raw
}

output "lb_public_ip" {
  value = huaweicloud_vpc_eip.eip-lb.address
}

output "lb_id" {
  value = huaweicloud_elb_loadbalancer.basic.id
}

output "lb_subnet_id" {
  value = huaweicloud_elb_loadbalancer.basic.ipv4_subnet_id
}


