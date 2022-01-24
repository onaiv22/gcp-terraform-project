resource "google_project_service" "this" {
    project = var.project
    service = var.services

    timeouts {
        create = "30m"
        update = "40m"
    }

    disable_dependent_services = true
}
