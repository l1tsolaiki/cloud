variable "yc_folder" {
  type = string
  description = "Yandex Cloud folder"
}

variable "yc_token" {
  type = string
  description = "Yandex Cloud OAuth token"
}

variable "user" {
  type = string
  description = "Local user"
}

variable "service_account_id" {
  type = string
  description = "Id of service account to be used"
}

variable "account_name" {
  type = string
  description = "Name for terraform service account"
}
