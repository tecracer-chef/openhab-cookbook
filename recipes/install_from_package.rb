#
# Cookbook Name:: openhab
# Recipe:: install_from_package
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

apt_repository :openhab do
  uri "http://repository-openhab.forge.cloudbees.com/release/#{node[:openhab][:version]}/apt-repo/"
  components ['/']
end

package 'openhab-runtime' do
  action :install
  options "--force-yes"
end

node['openhab']['plugins'].each do |plugin|
  package "openhab-addon-#{plugin}" do
    action :install
    options "--force-yes"
  end
end

service "openhab" do
  action :start
end
