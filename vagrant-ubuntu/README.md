# Packer to create Vagrant boxes for Ubuntu system

## How to create or update templates

* Install requirements
  * Packer
  * Vagrant
  * VirtualBox

* Open the repository in an IDE, such as Visual Studio Code
  * Update HCL and scripts files

* Validate locally the templates

```bash
# installs requirements
packer init .

# formats the template
packer fmt .

# validates the template
packer validate .

# debugs the build
PACKER_LOG=1 packer build ubuntu.pkr.hcl -var 'vagrant_source=generic/ubuntu2004'

# (optional) downloads the box and update the hcl file to use the local file
```

## How to build a new image

```bash
# installs requirements
packer init .

# builds the image
packer build ubuntu.pkr.hcl
```

## How to publish a new Vagrant box

```bash
# sets jfrog environment
export JFROG_INSTANCE=devpro.jfrog.io
export JFROG_REPOSITORY=rabbidsincubator-vagrant

# sets jfrog authentication credentials
export JFROG_USERNAME=
export JFROG_TOKEN=

# sets vagrant box information
export BOX_PROVIDER=virtualbox
export BOX_VERSION=1.0.0
export BOX_UBUNTUVERSION=ubuntu2004x64
export BOX_NAME=rabbidsincubator/${BOX_UBUNTUVERSION}

# pushes the new version of the box to the remote Vagrant repository (artifactory)
curl -u$JFROG_USERNAME:$JFROG_TOKEN -T output-ubuntu/package.box "https://${JFROG_INSTANCE}/artifactory/${JFROG_REPOSITORY}/${BOX_UBUNTUVERSION}-${BOX_PROVIDER}-${BOX_VERSION}.box;box_name=${BOX_NAME};box_provider=${BOX_PROVIDER};box_version=${BOX_VERSION}"
```
