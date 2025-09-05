#!/bin/bash

# اسم Resource Group
RESOURCE_GROUP="Azuredevops"

# Subscription ID
SUBSCRIPTION_ID="96587dff-f596-4825-9e39-9563f9ff9df0"

# استيراد Resource Group
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.resource_group.azurerm_resource_group.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP

# استيراد Virtual Network
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.network.azurerm_virtual_network.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/virtualNetworks/myApplication-NET

# استيراد Subnet
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.network.azurerm_subnet.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/virtualNetworks/myApplication-NET/subnets/myApplication-NET-sub

# استيراد NSG
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.nsg-test.azurerm_network_security_group.nsg \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/networkSecurityGroups/myApplication-NSG

# استيراد Public IP
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.publicip.azurerm_public_ip.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/publicIPAddresses/myApplication-publicip-pubip

# استيراد App Service Plan
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.appservice.azurerm_service_plan.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Web/serverFarms/myApplication-AppService-1

# استيراد App Service Web App
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.appservice.azurerm_linux_web_app.test \
  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Web/sites/myApplication-AppService-1

# استيراد NSG Association للـ Subnet
terraform import -lock=false -var="resource_group=$RESOURCE_GROUP" \
  module.nsg-test.azurerm_subnet_network_security_group_association.test \
  "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/virtualNetworks/myApplication-NET/subnets/myApplication-NET-sub|myApplication-NSG"

echo "تم استيراد كل الموارد بنجاح!"
