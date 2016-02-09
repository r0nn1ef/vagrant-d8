#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Update the Apt repository so we can install other packages.
execute "update apt" do
  command "apt-get update"
  ignore_failure true
end
