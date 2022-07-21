resource "huaweicloud_cce_cluster" "mycce" {
  name                   = "${var.cluster_name}-cluster"
  flavor_id              = var.cce_cluster_flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.private_subnet_id
  cluster_version        = var.cluster_version
  container_network_type = var.container_network_type
  authentication_mode    = var.authentication_mode
  kube_proxy_mode        = var.kube_proxy_mode
}

resource "huaweicloud_compute_keypair" "cce_node" {
  name       = join("-", [var.cluster_name, "node-keypair"])
  public_key = var.public_key
}

data "huaweicloud_availability_zones" "myaz" {}


resource "huaweicloud_cce_node" "mynode" {
  count             = var.node_count
  cluster_id        = huaweicloud_cce_cluster.mycce.id
  name              = "${var.cluster_name}-node-${count.index}"
  flavor_id         = var.cce_node_flavor_id
  availability_zone = data.huaweicloud_availability_zones.myaz.names[count.index % length(data.huaweicloud_availability_zones.myaz.names)]
  key_pair          = huaweicloud_compute_keypair.cce_node.name

  root_volume {
    size       = var.cce_node_root_size
    volumetype = var.volumetype
  }
  data_volumes {
    size       = var.cce_node_data_size
    volumetype = var.volumetype
  }

  tags = var.default_tags
}

data "huaweicloud_elb_flavors" "flavors" {
  count = var.enable_elb_loadbalancer ? 1 : 0
  
  type            = "L4"
  max_connections = var.lb_max_connections
}
resource "huaweicloud_elb_loadbalancer" "loadbalancer" {
  count = var.enable_elb_loadbalancer ? 1 : 0

  name              = "${var.cluster_name}-elb"
  description       = "Dedicated Loadbalancer for ${var.cluster_name}"
  cross_vpc_backend = true

  vpc_id = var.vpc_id

  l4_flavor_id = data.huaweicloud_elb_flavors.flavors.ids[0]

  availability_zone = [
    data.huaweicloud_availability_zones.myaz.names[0],
    data.huaweicloud_availability_zones.myaz.names[1],
  ]

  ipv4_eip_id = huaweicloud_vpc_eip.eip_lb.id

  tags = var.default_tags
}

resource "huaweicloud_vpc_eip" "eip_lb" {
  count = var.enable_elb_loadbalancer ? 1 : 0
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "${var.cluster_name}-lb-eip-bw"
    size        = var.lb_bandwidth_size
    share_type  = var.lb_share_type
    charge_mode = var.lb_charge_mode
  }
  tags = var.default_tags
}
