#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{
  php5
  php5-cli
  php5-curl
  php5-mysql
  php-pear
  libapache2-mod-php5
}.each do |pkg|
  package pkg do
    action :install
  end
end

template '/var/www/info.php' do
  source 'info.php'
  mode 0755
  owner 'root'
  group 'root'
end
