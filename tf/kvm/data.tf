data "openstack_networking_network_v2" "sharednet2" {
  name = "sharednet2"
}

data "openstack_networking_subnet_v2" "sharednet2_subnet" {
  name = "sharednet2-subnet"
}

# --- Security Groups ---

# SSH Access
data "openstack_networking_secgroup_v2" "allow_ssh" {
  name = "allow-ssh"  # Port 22
}

# MLflow (API and UI)
data "openstack_networking_secgroup_v2" "allow_8000" {
  name = "allow-8000"  # MLflow Tracking UI/API
}

# MinIO Console
data "openstack_networking_secgroup_v2" "allow_9001" {
  name = "allow-9001"  # MinIO Console Web UI
}

# Prometheus
data "openstack_networking_secgroup_v2" "allow_9090" {
  name = "allow-9090"  # Prometheus
}

# Grafana
data "openstack_networking_secgroup_v2" "allow_3000" {
  name = "allow-3000"  # Grafana
}

# ArgoCD Server / Web UI
data "openstack_networking_secgroup_v2" "allow_8080" {
  name = "allow-8080"  # ArgoCD Web
}

# Argo Workflows / Events UIs (Optional)
data "openstack_networking_secgroup_v2" "allow_8081" {
  name = "allow-8081"  # Argo Workflows UI
}

# Production / Staging / Canary — default HTTP access
data "openstack_networking_secgroup_v2" "allow_http_80" {
  name = "allow-http-80"  # For production web services
}

# Trigger
data "openstack_networking_secgroup_v2" "allow_9092" {
  name = "allow-9092"
}