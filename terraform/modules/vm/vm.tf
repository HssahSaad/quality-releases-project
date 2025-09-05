resource "azurerm_network_interface" "" {
  name                = ""
  location            = ""
  resource_group_name = ""

  ip_configuration {
    name                          = "internal"
    subnet_id                     = ""
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = ""
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = ""
  location            = ""
  resource_group_name = ""
  size                = "Standard_DS2_v2"
  admin_username      = ""
  network_interface_ids = []
  admin_ssh_key {
    username   = "hssah"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnxlSoVmRX01Be+F0ygG+rhSjvrg2+P3UVoCHXVZK6nxNixPX+DeM6asKtOngOnBxpcwrYt/Vk3lfpPLggN06wmngP8tpdnOStRLMYawMkI5cjhmnZ9ZPPGo9Kegg7oIoFQQ3MFve7/RpXVv41OzcPnoyVeDi+04SXbcyi15skkUA5OBGwmjzOIXEoaI6/RX/feH7m59S/o6KHrn7tVUm3FupHpLFgNsL0ZjJQwFyXMWc3TorsNg0ORprdY0FXLRZyTtqGIZKmINjVzQRVzgPocjhKKszMnJSXjaU/r501Ra2Z8pMIt3NGkzchuV+ERdPbky+aYqcysAX0NSvxi2rvsrMp7qcJBpC8lQxxVMXWjSI/k7uphLCcVxh2Bfx00SPaz+4v/vBgHNf2bmhAmp33OXvZDrH+pUHBqhPyVjo0cyEv1k0ZncsfA/nMLQC9bprYHGIvNSckPmM/0aUtBkeUafgl8BXdXr4TkDiL7l376ZoMoxPTtodh5itUbvy5Cd8= hssah@SandboxHost-638926817756757254"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
