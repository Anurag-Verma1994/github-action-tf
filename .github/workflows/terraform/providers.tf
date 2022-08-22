terraform{
  required_providers{
    google = {
      source = "hashicorp/google"
      version = "3.84.0" # update to latest version
    }
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}" # not required but recommended
}