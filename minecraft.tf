data "yandex_compute_image" "coi" {
  family = "container-optimized-image"
}

data "local_file" "docker_spec" {
  filename = "${path.root}/minecraft/docker-compose.yaml"
}

resource "yandex_compute_instance" "minecraft-server" {
  name = "minecraft-server"
  allow_stopping_for_update = true
  folder_id = var.yc_folder
  service_account_id = var.service_account_id
  platform_id = "standard-v2"
  resources {
    cores = 2
    memory = 2
    core_fraction = 100
  }
  boot_disk {
    mode = "READ_WRITE"
    initialize_params {
      image_id = "${data.yandex_compute_image.coi.id}"
      size = 30
    }
  }
  network_interface {
      subnet_id = "${yandex_vpc_subnet.main-a.id}"
      nat = true
  }
  metadata = {
      user-data = file("${path.module}/minecraft/cloud_config.yaml")
      docker-compose = data.local_file.docker_spec.content
  }
}
