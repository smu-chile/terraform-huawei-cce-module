output "kubeconfig" {
  value       = huaweicloud_cce_cluster.mycce.kube_config_raw
  description = "kubeconfig"
}
