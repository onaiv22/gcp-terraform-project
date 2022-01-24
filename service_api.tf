resource "google_project_service" "this" {
    project = "your-project-id"
    service = "iam.googleapis.com"

    timeouts {
        create = "30m"
        update = "40"
    }

    disable_dependent_service = true
}
