#!/bin/bash

component=$1
Environment=$2
dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/pavan-dum/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$component -e environment=$Environment roboshop.yaml
