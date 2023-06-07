teffaform{
    required_provider{
        google={
            source="hashicorp/google"
            version="~>3.70.0"
        }
    }
    required_version=">=1.20"
}

provider "google" {
  credentials = file("<PATH_TO_KEY_FILE>")
  project     = "<YOUR_PROJECT_ID>"
  region      = "<YOUR_REGION>"
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "n1-standard-1"
  zone         = "<YOUR_ZONE>"

  boot_disk {
    initialize_params {
      image = "<IMAGE_FAMILY>"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}