variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network"
}

variable "location" {
  type        = string
  description = "The Azure location to deploy the resources"
  nullable    = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetry.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "subnets" {
  type        = map(string)
  default     = {}
  description = "Map of subnet names to address prefixes"
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags to be applied to all resources"
}
