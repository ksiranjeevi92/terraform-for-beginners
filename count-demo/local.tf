locals {
    environemnt = "dev"
    project = "terraform-beginner"
    owner = "siranjeevi"

    common_tags = {
        Environment = local.environemnt
        Project = local.project
        Owner = local.owner
    }
}