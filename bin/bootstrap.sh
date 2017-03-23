#!/bin/bash

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
