variable "env" {
  description = "Name of the environment"
  default     = "dev"
  type        = string
}

variable "instance_type" {

}

variable "remote_state" {
  type = map(string)
}
