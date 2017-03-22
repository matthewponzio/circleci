#!/bin/bash

## Install unzip
apt-get install unzip

## Download and install AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

## Download and install Chef DK
aws s3 cp s3://ponzio-test/chefdk_1.2.22-1_amd64.deb .
dpkg -i chefdk_1.2.22-1_amd64.deb

## Download the Chef cookbook

aws s3 cp s3://ponzio-test/circleci.tar.gz .
mkdir /var/chef
cd /var/chef
aws s3 cp s3://ponzio-test/solo.rb .
aws s3 cp s3://ponzio-test/node.json .
tar -xvzf /circleci.tar.gz
chef-solo -c solo.rb -j node.json
