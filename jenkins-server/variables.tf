#--jenkins-server/variables.tf

variable "instance_type" {}

variable "user_data" {}

variable "key_name" {}

variable "public_key_path" {
    default = "/c/Users/imaze/.ssh/jenkins-keys.pub"
}
