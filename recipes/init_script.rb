#
# Cookbook Name:: openhab
# Recipe:: init_script
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

service 'openhab' do
  supports restart: true, start: true, stop: true, reload: true
  action :nothing
end

template 'openhab' do
  path '/etc/init.d/openhab'
  source 'openhab.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :enable, 'service[openhab]'
  notifies :start,  'service[openhab]'
end
