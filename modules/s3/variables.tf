variable "s3_bucket_name" {
  type = string
}

variable "versioning_enabled" {
  type = bool
  default = true
}

variable "principals" {
  type = list(string)
}
