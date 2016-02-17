#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2::default"
include_recipe "php::default"

group 'drupal'

user 'drupal' do
  group 'drupal'
  system true
  shell '/bin/bash'
end