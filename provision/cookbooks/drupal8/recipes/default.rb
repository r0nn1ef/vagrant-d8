#
# Cookbook Name:: drupal8
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'drupal'

user 'drupal' do
  group 'drupal'
  system true
  shell '/bin/bash'
end

include_recipe "apache2::default"