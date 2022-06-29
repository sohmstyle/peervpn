#!/bin/bash


cd /opt && mkdir /opt/repo

# Clone files
git clone 
cd peervpn

# Create Release file for APT repository
cat <<EOF >/opt/repo/Release
Origin: Private Repository
Label: Example
Suite: stable
Codename: stable
Version: 1.0
Architectures: amd64
Components: main
Description: An example software repository
EOF


# Start nginx with repo.conf as local APT repository
# Start building Docker image and start container with building deb package. After building container will be removed.
docker-compose up -d
sleep 20
ansible-playbook -K -e "hosts=localhost" -e "repo_url=http://127.0.0.1:8080/" repo.yml
