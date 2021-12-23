packer {
  required_plugins {
    vagrant = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

variable "vagrant_source" {
  type    = string
  default = "hashicorp/bionic64"
}

source "vagrant" "ubuntu" {
  add_force    = true
  communicator = "ssh"
  provider     = "virtualbox"
  source_path  = "${var.vagrant_source}"
}

build {
  name    = "ubuntu"
  sources = ["source.vagrant.ubuntu"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/update.sh"
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/clean.sh"
  }
}
