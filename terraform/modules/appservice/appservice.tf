resource "azurerm_service_plan" "test" {
  name                = "${var.application_type}-${var.resource_type}-1"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  os_type             = "Linux"
  sku_name            = "S1"
  tags = {
    project     = var.application_type
    environment = "dev"
  }
}

resource "azurerm_linux_web_app" "test" {
  name                = "${var.application_type}-${var.resource_type}-1"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  service_plan_id     = azurerm_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  site_config {
    always_on = false
  }
  tags = {
    project     = var.application_type
    environment = "dev"
  }
  depends_on = [azurerm_service_plan.test]
}
