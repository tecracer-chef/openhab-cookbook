#
# Cookbook Name:: openhab
# Recipe:: habmin
#
# Copyright (C) 2015 Justin Aiken
#
# MIT
#

git node[:openhab][:habmin][:install_dir] do
  repository node[:openhab][:habmin][:git_repository]
  revision node[:openhab][:habmin][:git_revision]
  user  node[:openhab][:habmin][:user]
  group node[:openhab][:habmin][:group]
  action :sync

  notifies :run, 'execute[move_habmin_jars]'
end

execute 'move_habmin_jars' do
  command "mv addons/*.jar #{node[:openhab][:install_dir]}/openhab/addons"
  cwd node[:openhab][:habmin][:install_dir]
  user  node[:openhab][:habmin][:user]
  group node[:openhab][:habmin][:user]
  action :nothing
end
