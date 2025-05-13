output "floating_ip_out" {
  value = openstack_networking_floatingip_v2.floating_ip.address
  description = "Public IP of the deployed node"
}