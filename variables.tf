variable "cluster_name" {
  type        = string
  description = "nombre del cluster. P.e: huawei-santiago-factory-front-develop"
}
variable "cce_cluster_flavor_id" {
  type        = string
  default     = "cce.s1.small"
  description = "Tipo de instancia de cluster"
}
variable "cce_node_data_size" {
  type        = string
  default     = "100"
  description = "Tamaño partición data en nodos, p.e: 100"
}
variable "cce_node_flavor_id" {
  type        = string
  default     = "s3.large.4"
  description = "Tipo de instancia para nodos"
}
variable "cce_node_root_size" {
  type        = string
  default     = "100"
  description = "Tamaño partición root en nodos"
}
variable "subnet_id" {
  type        = string
  description = "Network ID de subnet"
}
variable "vpc_id" {
  type        = string
  description = "ID de VPC"
}
variable "cluster_version" {
  type        = string
  default     = "v1.19.8-r1"
  description = "versión Kubernetes"
}
variable "node_count" {
  type        = number
  default     = 3
  description = "Cantidad de nodos"
}

variable "volumetype" {
  type = string
  default     = "SSD"
  description = "Tipo de volumen, SATA o SSD"
}

variable "public_key" {
  type        = string
  description = "Public para conexión con nodos"
}