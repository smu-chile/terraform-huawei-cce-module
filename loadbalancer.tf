data "huaweicloud_vpc_subnet" "subnet" {
  id = var.public_subnet_id
}

data "huaweicloud_elb_flavors" "flavors" {
  type = "L4"
  #Consul
  max_connections = var.lb_max_connections
}



resource "huaweicloud_elb_loadbalancer" "loadbalancer" {
  name              = "${var.cluster_name}-elb"
  description       = "Dedicated Loadbalancer for ${var.cluster_name}"
  cross_vpc_backend = true

  vpc_id = var.vpc_id

  l4_flavor_id = data.huaweicloud_elb_flavors.flavors.ids[0]

  availability_zone = [
    data.huaweicloud_availability_zones.myaz.names[0],
    data.huaweicloud_availability_zones.myaz.names[1],
  ]

  ipv4_eip_id = huaweicloud_vpc_eip.eip-lb.id

  tags = var.default_tags
}


resource "huaweicloud_vpc_eip" "eip-lb" {
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


