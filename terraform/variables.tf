variable "node_count" {
  description = "The number of instances to deploy for high availability"
  type        = number
  default     = 2
}

variable "memory_limit" {
  description = "RAM allocated per node"
  type        = string
  default     = "2G"
}
