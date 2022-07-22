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

resource "huaweicloud_compute_keypair" "cce-node" {
  name       = "${var.cluster_name}-node-keypair"
  public_key = var.public_key
}

data "huaweicloud_availability_zones" "myaz" {}


resource "huaweicloud_cce_node" "mynode" {
  count             = var.node_count
  cluster_id        = huaweicloud_cce_cluster.mycce.id
  name              = "${var.cluster_name}-node-${count.index}"
  flavor_id         = var.cce_node_flavor_id
  availability_zone = data.huaweicloud_availability_zones.myaz.names[count.index % length(data.huaweicloud_availability_zones.myaz.names)]
  key_pair          = huaweicloud_compute_keypair.cce-node.name

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
