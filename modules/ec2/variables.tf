variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instances" {
  type = map(object({
    subnet_id = string
    user_data = string
  }))
}
