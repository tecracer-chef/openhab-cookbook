#
# Cookbook Name:: openhab
# Recipe:: install_from_source
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

RELEASE_URL = "https://github.com/openhab/openhab/releases/download/"
VERSION_URL = "#{RELEASE_URL}v#{node[:openhab][:version]}/distribution-#{node[:openhab][:version]}-"

package 'unzip'

ark "openhab-#{node[:openhab][:version]}" do
  name 'openhab'
  url "#{VERSION_URL}runtime.zip"
  version node[:openhab][:version]
  path node[:openhab][:install_dir]
  owner node[:openhab][:user]
  group node[:openhab][:group]
  strip_components 0
  action :put
end

PLUGIN_REGEX = /\A(action|binding|persistance|io)\.(.*)\z/

if node['openhab']['plugins'].count > 0

  ark 'openhab-addons' do
    url "#{VERSION_URL}addons.zip"
    version node[:openhab][:version]
    path "#{node[:openhab][:install_dir]}/openhab/disabled-addons"
    owner node[:openhab][:user]
    group node[:openhab][:group]

    action :dump
  end

  directory "#{node[:openhab][:install_dir]}/openhab/addons" do
    owner node[:openhab][:user]
    group node[:openhab][:group]
    action :create
  end

  node['openhab']['plugins'].each do |plugin|
    jar_name = plugin.gsub(PLUGIN_REGEX, 'org.openhab.\1.\2') + "-#{node[:openhab][:version]}.jar"

    bash "install #{jar_name}" do
      cwd  "#{node[:openhab][:install_dir]}/openhab/addons"
      code "mv ../disabled-addons/#{jar_name} ."
      only_if { ::File.exists? "#{node[:openhab][:install_dir]}/openhab/disabled-addons/#{jar_name}" }
      not_if  { ::File.exists? "#{node[:openhab][:install_dir]}/openhab/addons/#{jar_name}"          }
    end
  end
end
