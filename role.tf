/* resource "google_organization_iam_custom_role" "cloudops" 
org_id      = "1764098786789" */
resource "google_project_iam_custom_role" "cloudops" {
  role_id     = "CloudOps"
  title       = "cloudops Role"
  description = "custom role for the CloudOps Cost Management SA"
  permissions = var.permissions
}

resource "google_service_account" "this" {
    account_id = "cloud-ops-costmanagement-sa"
    display_name = "CloudOps Cost Management SA"
    project      = "main1-project"
    description  = "service account for CloudOps-Cost-Management-SA"

}


