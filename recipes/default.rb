#
# Cookbook Name:: openhab
# Recipe:: default
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

include_recipe 'java' if node['openhab']['install_java']

if node['openhab']['install_method'] == 'package'
  include_recipe 'openhab::install_from_package'
else
  include_recipe 'openhab::install_from_source'
end
