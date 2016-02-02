#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache2" do
  action :install
end

execute "enable-mod-rewrite" do
  command "sudo a2enmod rewrite"
end