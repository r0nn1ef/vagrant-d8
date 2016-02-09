#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install our PHP packages
%w{
  php5
  php5-cli
  php5-curl
  php5-dev
  php5-gd
  php5-mcrypt
  libapache2-mod-php5
}.each do |pkg|
  package pkg do
    action :install
  end
end

# Copy a phpinfo file to the web root.
cookbook_file "/var/www/info.php" do
  source "info.php"
  mode 0755
  owner "root"
  group "root"
end

# Copy the modified apache php.ini file to the proper location.
cookbook_file "/etc/php5/apache2/php.ini" do
  source "apache-php.ini"
  mode 0644
  owner "root"
  owner "root"
  action :create
  notifies :restart, 'service[apache2]', :immediately
end

# Copy the modified cli php.ini file to the proper location.
cookbook_file "/etc/php5/cli/php.ini" do
  source "cli-php.ini"
  mode 0644
  owner "root"
  owner "root"
  action :create
end