resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

# Create a public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "my-public-API-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = "vms-api"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard_F2"
  instances           = 2
  admin_username = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  zones               = [1, 2]
  zone_balance        = true


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${azurerm_public_ip.public_ip.ip}}, -u ${var.ssh_user} ansible/deployAPI.yml"
    working_dir = "./ansible"  # Path to the Ansible playbook
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "network_interface_vms_api"
    primary = true

    ip_configuration {
      name    = "external"
      primary = true
      public_ip_address {
        name = "my-public-API-ip"
      }
    }
  }
}