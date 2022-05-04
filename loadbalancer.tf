data "huaweicloud_vpc_subnet" "subnet" {
  id = var.public_subnet_id
}

data "huaweicloud_elb_flavors" "flavors" {
  type = "L4"
  #Consul
  max_connections = 1000000
}



resource "huaweicloud_elb_loadbalancer" "loadbalancer" {
  name              = "${var.cluster_name}-elb"
  description       = "Dedicated Loadbalancer for ${var.cluster_name}"
  cross_vpc_backend = true

  vpc_id = var.vpc_id

  l4_flavor_id = data.huaweicloud_elb_flavors.flavors.ids[0]

  #Consul
  bandwidth_size        = 50
  bandwidth_charge_mode = "traffic"
  iptype                = "5_bgp"
  sharetype             = "PER"

  availability_zone = [
    data.huaweicloud_availability_zones.myaz.names[0],
    data.huaweicloud_availability_zones.myaz.names[1],
  ]

  ipv4_eip_id = huaweicloud_vpc_eip.eip-lb.id
}


resource "huaweicloud_vpc_eip" "eip-lb" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "${var.cluster_name}-lb-eip-bw"
    size        = 50
    share_type  = "PER"
    charge_mode = "traffic"
  }
  tags = var.default_tags
}


