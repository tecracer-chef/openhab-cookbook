#
# Cookbook Name:: openhab
# Attributes:: default
#
# Copyright 2015, Justin Aiken
#

default['openhab']['install_java']   = true
default['openhab']['install_method'] = 'package'
default['openhab']['version']        = '1.7.1'
default['openhab']['plugins']        = []

# Source only options:
default['openhab']['install_dir'] = '/opt'
default['openhab']['user']        = 'root'
default['openhab']['group']       = 'root'

# Init script options:
default['openhab']['http_port']  = '8080'
default['openhab']['https_port'] = '8443'

# my.openHAB options:
default['openhab']['my']['version'] = '1.7.0'

# habmin options:
default['openhab']['habmin']['install_dir']    = '/opt/openhab/webapps/habmin'
default['openhab']['habmin']['git_repository'] = 'https://github.com/cdjackson/HABmin'
default['openhab']['habmin']['git_revision']   = 'e523d77c7a3d73d75ce050a582a3bfe8bc7a1324' # v0.1.3-snapshot
default['openhab']['habmin']['user']           = 'root'
default['openhab']['habmin']['group']          = 'root'
