variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}
