data "huaweicloud_vpc_subnet" "subnet" {
  id = var.public_subnet_id
}

resource "huaweicloud_lb_loadbalancer" "loadbalancer" {
  name          = "${var.cluster_name}-lb"
  vip_subnet_id = data.huaweicloud_vpc_subnet.subnet.subnet_id
  tags          = var.default_tags
}

resource "huaweicloud_vpc_eip" "eip-lb" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "${var.cluster_name}-lb-eip-bw"
    size        = 8
    share_type  = "PER"
    charge_mode = "traffic"
  }
  tags = var.default_tags
}

resource "huaweicloud_networking_eip_associate" "eip_1" {
  public_ip = huaweicloud_vpc_eip.eip-lb.address
  port_id   = huaweicloud_lb_loadbalancer.loadbalancer.vip_port_id
}
