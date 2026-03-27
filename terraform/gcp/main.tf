# GCP provider inherited from root - no local provider


resource "google_container_cluster" "poc" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}

