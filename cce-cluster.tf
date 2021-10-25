resource "huaweicloud_cce_cluster" "mycce" {
  name                   = "${var.cluster_name}-cluster"
  flavor_id              = var.cce_cluster_flavor_id
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet_id
  cluster_version        = var.cluster_version
  container_network_type = "overlay_l2"
  authentication_mode    = "rbac"
}

resource "huaweicloud_compute_keypair" "cce-node" {
  name       = "${var.cluster_name}-node-keypair"
  public_key = var.public_key
}

data "huaweicloud_availability_zones" "myaz" {}

data "huaweicloud_compute_flavors" "flavors" {
  count             = var.node_count
  availability_zone = data.huaweicloud_availability_zones.myaz.names[count.index % length(data.huaweicloud_availability_zones.myaz.names)]
  performance_type  = "normal"
  cpu_core_count    = var.cce_node_cpu_core_count
  memory_size       = var.cce_node_memory_size
}

resource "huaweicloud_cce_node" "mynode" {
  count             = var.node_count
  cluster_id        = huaweicloud_cce_cluster.mycce.id
  name              = "${var.cluster_name}-node-${count.index}"
  flavor_id         = data.huaweicloud_compute_flavors.flavors[count.index].ids
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
