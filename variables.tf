variable "region" {
    type = string 
    default = ""
}
variable "credentials" {
    type = string 
    description = "terraform authentication credentials"
}
variable "project" {
    type = string 
    description = "project name"
}

variable "services" {
    type = string
    description = "api services to enable"
    default = "monitoring.googleapis.com"
}

variable "permissions" {}