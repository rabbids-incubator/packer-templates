# Packer templates

Packer templates to build and publish machines images.

## How to use

## Vagrant boxes

* Look at the available Vagrant boxes on [Artifactory repository](https://devpro.jfrog.io/ui/repos/tree/General/rabbidsincubator-vagrant)

System | Package name | Base box image
------ | ------------ | --------------
Ubuntu 20.04 (Focal) x64 | [rabbidsincubator/ubuntu2004x64](https://devpro.jfrog.io/ui/packages/vagrant:%2F%2Frabbidsincubator%2Fubuntu2004x64?type=packages) | `generic/ubuntu2004`
Ubuntu 18.04 (Bionic) x64 | [rabbidsincubator/ubuntu1804x64](https://devpro.jfrog.io/ui/packages/vagrant:%2F%2Frabbidsincubator%2Fubuntu1804x64?type=packages) | `hashicorp/bionic64`

* Reference the image in the Vagrantfile

```bash
# gets locally the vagrant boxes from the remote Vagrant repository (artifactory)
vagrant box add "https://devpro.jfrog.io/artifactory/api/vagrant/rabbidsincubator-vagrant/rabbidsincubator%2Fubuntu2004x64"
vagrant box add "https://devpro.jfrog.io/artifactory/api/vagrant/rabbidsincubator-vagrant/rabbidsincubator%2Fubuntu1804x64"

# creates Vagrantfile on a specific version
vagrant init rabbidsincubator/ubuntu1804x64

# starts the machine
vagrant up

# cleans up
vagrant destroy -f
rm -r .vagrant/
rm Vagrantfile
```

## How to contribute

* Read [design documentation](./docs/design.md)

* Look at the templates

Template folder | Image type | System
--------------- | ---------- | ------
[`vagrant-ubuntu`](./vagrant-ubuntu/README.md) | Vagrant box | Ubuntu
