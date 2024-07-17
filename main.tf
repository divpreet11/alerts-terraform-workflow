# data "newrelic_entity" "apps" {
#   name = "DESKTOP-86P5T8D"
#     # domain = "APM"
#     # type = "APPLICATION"
#   tag {
#     key   = "accountId"
#     value = "4438277"
#   }
# }

resource "newrelic_alert_policy" "example" {
  name = "Example Alert Policy"
}

resource "newrelic_nrql_alert_condition" "high_cpu_utilization" {
  policy_id = newrelic_alert_policy.example.id
  name      = "High CPU Utilization"
  # runbook_url = ""

  term {
    # duration      = "5"
    operator           = "above"
    priority           = "critical"
    threshold          = "80"
    threshold_duration = "60"
    time_function      = "all"

  }

  nrql {
    query       = "SELECT average(cpuPercent) FROM SystemSample WHERE cpuPercent > 80"
    since_value = "5"
  }
}



