#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "update-package-manager" do
  command "apt-get update"
  ignore_failure true
  timeout 6000
end