#
# Cookbook Name:: openhab
# Recipe:: my_openhab
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

# %w{webapps webapps/static}.each do |dir|
#   directory "#{node[:openhab][:install_dir]}/openhab/#{dir}" do
#     owner node[:openhab][:user]
#     group node[:openhab][:group]
#     action :create
#   end
# end

if node[:openhab][:my][:version] < "1.7.0"
  JAR_NAME   = "org.openhab.io.myopenhab-#{node[:openhab][:my][:version]}-SNAPSHOT.jar"
  SOURCE_URL = "https://my.openhab.org/downloads/#{JAR_NAME}"
else
  JAR_NAME   = "org.openhab.io.myopenhab-#{node[:openhab][:my][:version]}.jar"
  SOURCE_URL = "https://bintray.com/artifact/download/openhab/mvn/org/openhab/io/org.openhab.io.myopenhab/#{node[:openhab][:my][:version]}/#{JAR_NAME}"
end

remote_file "#{node[:openhab][:install_dir]}/openhab/addons/#{JAR_NAME}" do
  source SOURCE_URL
  owner node[:openhab][:user]
  group node[:openhab][:group]
  action :create_if_missing
end
