data "google_billing_account" "account" {
  billing_account = "01898B-D15FE6-8AA375"
}

resource "google_billing_budget" "this" {
  billing_account = data.google_billing_account.account.id
  display_name = "130% of Last Month"
  amount {
    specified_amount {
      currency_code = "GBP"
      units = "10"
    }
  }
  threshold_rules {
      threshold_percent =  0.6
  }
  threshold_rules {
      threshold_percent = 1.3
      spend_basis = "CURRENT_SPEND"
  }
  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.notification_channel.id,
    ]
    disable_default_iam_recipients = true
  }
}

resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = "Notification Channel"
  type         = "email"

  labels = {
    email_address = "akinolajimoh@gmail.com"
  }
}

/* resource "google_service_account" "this" {
    account_id = "zizi-app"
    display_name = "zizi Account"
    project      = "main1-project"
    description  = "service account for zizi"

} */