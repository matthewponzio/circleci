#
# Cookbook:: circleci
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'apache2'
# package 'php'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

group 'web_admin'

user 'web_admin' do
  group 'web_admin'
  system true
  shell '/bin/bash'

end
template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'web_admin'
  group 'web_admin'
end


aws_s3_file '/tmp/appfile.sh' do
  bucket 'ponzio-test'
  remote_path '/appfile.sh'
  region 'us-east-1'
end
