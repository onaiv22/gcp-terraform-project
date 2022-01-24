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