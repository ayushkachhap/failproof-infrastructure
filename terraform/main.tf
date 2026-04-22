resource "multipass_instance" "portfolio_node" {
  # The count meta-argument loops through and creates multiple VMs
  count  = var.node_count
  
  # Dynamically names them: portfolio-node-1, portfolio-node-2
  name   = "portfolio-node-${count.index + 1}"
  
  cpus   = 2
  memory = var.memory_limit
  disk   = "10G"

  # NOTE: We will uncomment this in the next phase when we introduce 
  # security policies that mandate a cloud-init hardening script.
  cloudinit_file = "${path.module}/cloud-init.yaml"
}

output "node_ip_addresses" {
  description = "A map of node names to their IP addresses"
  value       = { for node in multipass_instance.portfolio_node : node.name => node.ipv4 }
}
