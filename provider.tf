terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.38.1"
    }
  }
}
provider "newrelic" {
  # account_id = 4438277                         # Your New Relic account ID
  # api_key    = "NRAK-E3GS6X7HIYRIFPH0Z6PAX2RRTW3" # Your New Relic user key

  # account_id = "3993326"

  # api_key = "NRAK-MWH2ZNXFBDJIKQJ0FB3TQPA7AVP"
}
// email attachment
resource "newrelic_alert_channel" "email_channel" {
  name = "Email Channel"
  type = "email"

  config {
    recipients         = "architamoudgills@gmail.com"
    include_json_attachment = true
  }
}
//ASSOCIAITING THE ALERT CHANNEL WITH POLICY 
resource "newrelic_alert_policy_channel" "example_policy_channel" {
  policy_id  = newrelic_alert_policy.example.id
  channel_ids = [newrelic_alert_channel.email_channel.id]
}
