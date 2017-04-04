# CircleCI
Repo for basic CircleCI Pipeline...for deploying CircleCI

This Project is running on CircleCI.com

## Chef Cookbook
The current Chef Coookbook, while called CircleCI, does NOT deploy CircleCI
It only installs Apache and configures a "hello world" main page

## CloudFormation
Basic CFN that deploys an Amazon Linux EC2 Instance
- User Data:
  - Installs unzip
  - Downloads, unzips and installs AWS CloudFormation
  - Downloads and runs a bootstrap.sh script

## Circle.YML
CircleCI configuration file that defines the pipeline actions
- Installs dependencies
  - ChefDK
  - ChefSpec
  - KitchenDocket
- Runs Tests
  - Foodcritic
  - Rubocop
  - AWS Validate-Template
- Deploys
  - Packages the Cookbook using Berkshelf
  - Copies packaged Cookbook and support files up to S3
    - Packaged Cookbook - circleci.tar.gz
    - node.json
    - solo.rb
    - bootstrap.sh
    - CFN: chef_deploy.yml
  - Runs cloudformation create-stack
  test
