data "huaweicloud_vpc_subnet" "subnet" {
  id = var.public_subnet_id
}

resource "huaweicloud_elb_loadbalancer" "basic" {
  name              = "${var.cluster_name}-elb"
  description       = "basic example"
  cross_vpc_backend = true

  vpc_id            = var.vpc_id
  ipv4_subnet_id    = data.huaweicloud_vpc_subnet.subnet.subnet_id

  l4_flavor_id = "Small I"
  

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


