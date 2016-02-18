#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{
  apache2
  php5
  libapache2-mod-php5
  php5-cli
  php5-curl
  php5-gd
  php5-geoip
  php5-intl
  php5-mcrypt
  php5-memcache
}.each do |pkg|
  package pkg do
    action :install
  end
end