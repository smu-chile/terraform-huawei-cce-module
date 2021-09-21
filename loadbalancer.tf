data "huaweicloud_vpc_subnet" "subnet" {
  id = var.subnet_id
}

resource "huaweicloud_lb_loadbalancer" "loadbalancer" {
  name          = "${var.cluster_name}-lb"
  vip_subnet_id = data.huaweicloud_vpc_subnet.subnet.subnet_id
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
}

resource "huaweicloud_networking_eip_associate" "eip_1" {
  public_ip = huaweicloud_vpc_eip.eip-lb.address
  port_id   = huaweicloud_lb_loadbalancer.loadbalancer.vip_port_id
}



# resource "huaweicloud_lb_listener" "lb_listener_http" {
#   name            = "${var.cluster_name}-lb-list-http"
#   protocol        = "TCP"
#   protocol_port   = 80
#   loadbalancer_id = huaweicloud_lb_loadbalancer.loadbalancer.id
# }

# resource "huaweicloud_lb_listener" "lb_listener_https" {
#   name            = "${var.cluster_name}-lb-list-https"
#   protocol        = "TCP"
#   protocol_port   = 443
#   loadbalancer_id = huaweicloud_lb_loadbalancer.loadbalancer.id
# }

# resource "huaweicloud_lb_pool" "lb_pool_http" {
#   name        = "${var.cluster_name}-lb-pool-http"
#   protocol    = "TCP"
#   lb_method   = "ROUND_ROBIN"
#   listener_id = huaweicloud_lb_listener.lb_listener_http.id
# }

# resource "huaweicloud_lb_pool" "lb_pool_https" {
#   name        = "${var.cluster_name}-lb-pool-https"
#   protocol    = "TCP"
#   lb_method   = "ROUND_ROBIN"
#   listener_id = huaweicloud_lb_listener.lb_listener_https.id
# }

# resource "huaweicloud_lb_monitor" "health_check_http" {
#   name           = "health_check"
#   type           = "TCP"
#   delay          = 5
#   timeout        = 3
#   max_retries    = 3
#   pool_id        = huaweicloud_lb_pool.lb_pool_http.id
# }

# resource "huaweicloud_lb_monitor" "health_check_https" {
#   name           = "health_check"
#   type           = "TCP"
#   delay          = 5
#   timeout        = 3
#   max_retries    = 3
#   pool_id        = huaweicloud_lb_pool.lb_pool_https.id
# }


# resource "huaweicloud_lb_member" "members_http" {
#   count         = var.node_count
#   address       = huaweicloud_cce_node.mynode[count.index].private_ip
#   protocol_port = 30080
#   weight        = 1
#   pool_id       = huaweicloud_lb_pool.lb_pool_http.id
#   subnet_id     = data.huaweicloud_vpc_subnet.subnet.subnet_id
# }


# resource "huaweicloud_lb_member" "members_https" {
#   count         = var.node_count
#   address       = huaweicloud_cce_node.mynode[count.index].private_ip
#   protocol_port = 30443
#   weight        = 1
#   pool_id       = huaweicloud_lb_pool.lb_pool_https.id
#   subnet_id     = data.huaweicloud_vpc_subnet.subnet.subnet_id
# }
