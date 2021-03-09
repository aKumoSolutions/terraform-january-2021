variable "my_list" {
  type = list(string)
  default = ["first", "second", "third", "fourth", "fifth"]
}

variable "rules" {
    type = list(object({
            port = number
            cidr = list(string)
            description = string
        }
    ))
    default = [
        {
            port = 80
            cidr = ["1.2.3.4/32", "0.0.0.0/0"]
            description = "http"
        },
        {
            port = 443
            cidr = ["1.2.3.4/32"]
            description = "https"
        }
    ]
}
