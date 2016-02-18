#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Run apt-get update to update packages from the repository.
execute "update repo packages" do
  command "apt-get update"
end

%w{
  curl
  vim
}.each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe "web::default"
# include_recipe "php::default"
# include_recipe "drupal8::default"

drupal_site node["base"]["server_name"] do
  path "/var/www"
  version "8.0.3"
  database node["base"]["database"]
  db_username node["base"]["db_username"]
  db_password node["base"]["db_password"]
  # template "site.conf.erb"
end

# group 'drupal'

# user 'drupal' do
#   group 'drupal'
#   system true
#   shell '/bin/bash'
# end