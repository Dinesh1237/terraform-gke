output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "region" {
  value = google_container_cluster.gke.location
}
