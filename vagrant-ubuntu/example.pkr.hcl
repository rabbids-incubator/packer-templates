packer {
  required_plugins {
    vagrant = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

// variable "version" {
//   type = string
// }

source "vagrant" "bionic" {
  add_force    = true
  communicator = "ssh"
  provider     = "virtualbox"
  source_path  = "hashicorp/bionic64"
  // source_path  = "file://virtualbox.bionic64.box"
}

build {
  sources = ["source.vagrant.bionic"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script          = "scripts/setup.sh"
  }

  // post-processor "vagrant" {
  // vagrantfile_template = "./Vagrantfile"
  // keep_input_artifact = true
  // provider_override = "virtualbox"
  // }
}
