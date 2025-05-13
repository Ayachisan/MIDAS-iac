provider "openstack" {
  cloud = "chi-tacc"  # Make sure clouds.yaml has this
}

resource "openstack_compute_instance_v2" "nodes" {
  for_each    = var.nodes
  name        = "${each.key}-mlops-${var.suffix}"
  image_name  = "CC-Ubuntu24.04-CUDA"
  flavor_name = "baremetal"
  key_pair    = var.key

  network {
    name = "sharednet1"
  }

  scheduler_hints {
    additional_properties = {
      reservation = var.reservation_id
    }
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "127.0.1.1 ${each.key}-mlops-${var.suffix}" >> /etc/hosts
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
  description = "Floating IP address of node1"
  value       = openstack_networking_floatingip_v2.floating_ip.address
}