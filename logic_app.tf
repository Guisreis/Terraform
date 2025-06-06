resource "azurerm_eventgrid_topic" "example" {
  name                = "example-topic"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  topic_type          = "EventHub"
}

resource "azurerm_eventgrid_event_subscription" "start_vm_subscription" {
  name                 = "start-vm-subscription"
  scope                = azurerm_eventgrid_topic.example.id
  event_delivery_schema = "EventGridSchema"
  event_type           = "VmStartEvent"  # Defina o tipo de evento correto
  endpoint_type        = "AzureFunction"
  endpoint_uri         = azurerm_function_app.start_vm_app.trigger_url
}

resource "azurerm_eventgrid_event_subscription" "stop_vm_subscription" {
  name                 = "stop-vm-subscription"
  scope                = azurerm_eventgrid_topic.example.id
  event_delivery_schema = "EventGridSchema"
  event_type           = "VmStopEvent"  # Defina o tipo de evento correto
  endpoint_type        = "AzureFunction"
  endpoint_uri         = azurerm_function_app.stop_vm_app.trigger_url
}