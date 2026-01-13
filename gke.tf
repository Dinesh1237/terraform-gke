resource "google_container_cluster" "gke" {
  name     = "baby-gke"
  location = "asia-south1"

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  remove_default_node_pool = true
  initial_node_count       = 1
}
resource "google_container_node_pool" "nodes" {
  name       = "baby-node-pool"
  location   = "asia-south1"
  cluster    = google_container_cluster.gke.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

#These are VMs

#Pods run on these machines

