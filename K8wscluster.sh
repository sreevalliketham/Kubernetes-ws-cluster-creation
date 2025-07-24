#!/bin/bash

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

xfs_growfs /
xfs_growfs /var


ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
eksctl version
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /usr/local/bin/kubectl
kubectl version

yum install -y aws-cli

ACCESS_KEY=$(aws ssm get-parameter --name "my-access-key" --with-decryption --query "Parameter.Value" --output text)
SECRET_KEY=$(aws ssm get-parameter --name "my-secret-key" --with-decryption --query "Parameter.Value" --output text)

mkdir -p /home/ec2-user/.aws

echo "[default]" > /home/ec2-user/.aws/credentials
echo "aws_access_key_id=$ACCESS_KEY" >> /home/ec2-user/.aws/credentials
echo "aws_secret_access_key=$SECRET_KEY" >> /home/ec2-user/.aws/credentials

echo "[default]" > /home/ec2-user/.aws/config
echo "region=us-east-1" >> /home/ec2-user/.aws/config
chown -R ec2-user:ec2-user /home/ec2-user/.aws
             