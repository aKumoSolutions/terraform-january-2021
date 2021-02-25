variable "r_env" {
  type    = string
  default = "dev"
}

variable "r_skip_snapshot" {
  type    = bool
  default = true
}

variable "r_storage" {
  type    = string
}

variable "r_instance_class" {
  type    = string
}

variable "r_username" {
  type    = string
}
