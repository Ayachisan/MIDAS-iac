
resource "openstack_compute_instance_v2" "nodes" {
  for_each = var.nodes

  name        = "${each.key}-mlops-${var.suffix}"
  image_name  = "CC-Ubuntu24.04"
  flavor_name = "baremetal"
  key_pair    = var.key

  network {
    name = "sharednet1"
  }

  scheduler_hints {
    reservation = "24a7ddbb-5330-4554-ba3f-f5a7f704ccb7" 
  }

  user_data = <<-EOF
    #! /bin/bash
    sudo echo "127.0.1.1 ${each.key}-mlops-${var.suffix}" >> /etc/hosts
    su cc -c /usr/local/bin/cc-load-public-keys
  EOF
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  instance_id = openstack_compute_instance_v2.nodes["node1"].id
}

output "floating_ip_out" {
  value = openstack_networking_floatingip_v2.floating_ip.address
}
