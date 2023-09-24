resource "yandex_vpc_network" "main" {
    name = "main"
}

resource "yandex_vpc_subnet" "main-a" {
  name = "main-a"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.main.id}"
  v4_cidr_blocks = ["10.128.0.0/24"]
}

resource "yandex_vpc_subnet" "main-b" {
  name = "main-b"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.main.id}"
  v4_cidr_blocks = ["10.129.0.0/24"]
}

resource "yandex_vpc_subnet" "main-c" {
  name = "main-c"
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.main.id}"
  v4_cidr_blocks = ["10.130.0.0/24"]
}