# Azure VM per Terraform (A reikalavimas). 6 etapo (Azure) etalonas.
# terraform init && terraform apply -var 'ssh_public_key=...'
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "ssh_public_key" {
  type = string
}
variable "location" {
  type    = string
  default = "swedencentral"
}
variable "shutdown_notification_email" {
  type        = string
  default     = ""
  description = "Neprivaloma: kur siųsti perspėjimą prieš auto-shutdown. Tuščia = pranešimų nėra. Nustatykite tik terraform.tfvars (jis ne Git'e)."
}
variable "my_ip_cidr" {
  type        = string
  description = "Jūsų viešas IP, iš kurio leidžiamas SSH, pvz. 1.2.3.4/32. Numatytosios reikšmės nėra: pasikeitus IP atnaujinkite terraform.tfvars ir paleiskite apply."
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-etalonas"
  location = var.location
  tags     = { projektas = "etalonas", savininkas = "studentas" }
}

# Biudžetas valdomas portale (Cost Management → Budgets), ne Terraform; resursas išjungtas.
# Sąmoningai nekuriamas: 35 EUR/mėn., perspėjimai 50/80/100 %. Žr. azure/README.md.
# (Ankstesnis azurerm_consumption_budget_resource_group kodas liko Git istorijoje.)

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-etalonas"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

# SSH (22) ir HTTP/HTTPS (80/443) leidžiami tik iš var.my_ip_cidr. Viešam atvėrimui žr. README.
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-etalonas"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "ssh-tik-mano-ip"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.my_ip_cidr
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "http-https-tik-mano-ip"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = var.my_ip_cidr
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "ip" {
  name                = "pip-etalonas"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-etalonas"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                              = "vm-etalonas"
  location                          = azurerm_resource_group.rg.location
  resource_group_name               = azurerm_resource_group.rg.name
  size                              = "Standard_B2s_v2" # x86, 2 vCPU, 8 GB: k3s + Argo CD + PostgreSQL (B2ms šioje prenumeratoje apribotas)
  custom_data                       = base64encode(file("${path.module}/cloud-init.yaml"))
  admin_username                    = "azureuser"
  disable_password_authentication   = true
  vm_agent_platform_updates_enabled = true # Azure įjungia pats; fiksuojam, kad plan nerodytų drift'o
  network_interface_ids             = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  # Ubuntu 22.04 sąmoningai; atnaujinimas į 24.04 (offer "ubuntu-24_04-lts", sku "server") vėliau, atskiru žingsniu.
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

# Auto-shutdown tik IŠJUNGIA VM (deallocate); įjungti reikia ranka: az vm start.
# "FLE Standard Time" = Vilnius, Kijevas, Ryga, Talinas, Helsinkis (Windows formato laiko juostos pavadinimas).
resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown" {
  virtual_machine_id    = azurerm_linux_virtual_machine.vm.id
  location              = azurerm_resource_group.rg.location
  enabled               = true
  daily_recurrence_time = "2200"
  timezone              = "FLE Standard Time"

  notification_settings {
    enabled = var.shutdown_notification_email != ""
    email   = var.shutdown_notification_email != "" ? var.shutdown_notification_email : null
  }
}

output "public_ip" {
  value = azurerm_public_ip.ip.ip_address
}
