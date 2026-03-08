#!/bin/bash

#we created 50gb volume and attached to the instance. 
#Now we need to grow the root volume to use the additional space.
growpart /dev/nvme0n1 
lvextend -r -L+30G /dev/mapper/RootVG-homeVol 
xfs_growfs /home 

yum install -y yum-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform