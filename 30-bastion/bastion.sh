#!/bin/bash

# We are creating 50GB root disk, but only 20GB is partitioned
# Remaining 30GB we need to extend using below commands
growpart /dev/nvme0n1 4
pvresize /dev/nvme0n1p4

lvextend -r -l +100%FREE /dev/mapper/RootVG-rootVol

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform