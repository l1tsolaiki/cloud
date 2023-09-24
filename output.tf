output "ipv4-internal" {
  value = "${yandex_compute_instance.minecraft-server.network_interface.0.ip_address}"
  description = "Minecraft server internal ipv4 address"
}

output "ipv4-external" {
  value = "${yandex_compute_instance.minecraft-server.network_interface.0.nat_ip_address}"
  description = "Minecraft server external ipv4 address"
}
