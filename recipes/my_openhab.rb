#
# Cookbook Name:: openhab
# Recipe:: my_openhab
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

jar_name = "org.openhab.io.myopenhab-#{node[:openhab][:my][:version]}-SNAPSHOT.jar"

remote_file "#{node[:openhab][:install_dir]}/openhab/addons/#{jar_name}" do
  source "https://my.openhab.org/downloads/#{jar_name}"
  owner node[:openhab][:user]
  group node[:openhab][:group]
  action :create_if_missing
end
