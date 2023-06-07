teffaform{
    required_provider{
        azurerm={
            source="hashicorp/azurerm"
            version="~>3.0.1"
        }
    }
    required_version=">=1.20"
}
resource "azurerm_virtual_machine" "my_vm" {
  name                  = "myvm"
  location              = "East US"
  resource_group_name   = "myresourcegroup"
  network_interface_ids = ["${azurerm_network_interface.my_nic.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = "ubuntu"
    admin_password = "P@ssw0rD19/23!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}