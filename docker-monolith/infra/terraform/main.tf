
terraform {
  # Версия terraform
  required_version = "~> 0.12.19"
}

provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  project = var.project

  region = var.region
}

resource "google_compute_instance" "docker" {
  count        = var.insta_count
  name         = "docker-base-${count.index}"
  machine_type = "n1-standard-1"
  zone         = var.zone
  tags         = ["docker", "docker-machine"]
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  labels = {
    env = var.labels
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    # путь до публичного ключа
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

}
