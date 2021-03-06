#!/bin/bash -ue
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done

sudo apt-get update
sudo apt-get install -y libpython2.7-dev python-pip libffi-dev libssl-dev
cat <<EOT > /tmp/requirements.txt
ansible==1.9.6
awscli==1.11.44
boto==2.45.0
EOT
sudo pip install -r /tmp/requirements.txt
