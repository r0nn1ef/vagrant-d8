#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache2" do
  action :install
end

# Enable apache mod_rewrite because we'll need it for Drupal.
execute "enable mod_rewrite" do
  command "a2enmod rewrite"
end

# Copy a modified default apache config file which enables mod_rewrite for the default virtual host.
cookbook_file "/etc/apache2/sites-available/default" do
  source "apache-default.conf"
  mode 0644
  owner "root"
  group "root"
  action :create
end

# Start the apache service
service "apache2" do
  action [:enable, :start]
  supports [:start, :stop, :restart]
end
