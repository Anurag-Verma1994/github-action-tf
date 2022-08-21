resource "google_compute_address" "static" {
  name = "vm-address"
  project = var.project
  region = var.region    
}
# Create compute instances
resource "google_compute_instance" "instances" {
  name         = "training-server" 
  machine_type = "f1-micro" 
  zone         = "${var.region}" 
  tags         = "${var.tag}"
  depends_on = [ google_compute_address.static]
  
  boot_disk { 
    initialize_params {
      image = "centos-cloud/centos-7" 
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  metadata = {
    ssh-keys = "${var.user}:${file(var.publickeypath)}"
  }
  provisioner "remote-exec" {
    connection {
      host        = google_compute_address.static.address
      type        = "ssh"
      user        = var.user 
      timeout     = "500s"
      private_key = file(var.privatekeypath)
    }
    inline = [
      "sudo yum -y install epel-release",
      "sudo yum -y install nginx",
      "sudo nginx -v",
    ]
  }
  service_account {
    email  = var.email
    scopes = var.scopes
  }
  
}