module "network" {
  source = "../" # Use the root module we just created

  resource_group_name  = "${var.owner}-${var.name_prefix}-network-rg"
  location             = var.location
  virtual_network_name = "${var.owner}-${var.name_prefix}-vnet"
  address_space        = [var.virtual_network_cidr]

  subnets = {
    "default"            = cidrsubnet(var.virtual_network_cidr, 2, 0)
    "AzureBastionSubnet" = cidrsubnet(var.virtual_network_cidr, 2, 1)
    "GatewaySubnet"      = cidrsubnet(var.virtual_network_cidr, 2, 2)
  }

  tags = var.tags
}
