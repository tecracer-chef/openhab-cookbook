#
# Cookbook Name:: openhab
# Attributes:: default
#
# Copyright 2015, Justin Aiken
#

default['openhab']['install_java']   = true
default['openhab']['install_method'] = 'package'
default['openhab']['version']        = '1.6.2'
default['openhab']['plugins']        = []

# Source only options:
default['openhab']['install_dir'] = '/opt'
default['openhab']['user']        = 'root'
default['openhab']['group']       = 'root'

# Init script options:
default['openhab']['http_port']  = '8080'
default['openhab']['https_port'] = '8443'

# my.openHAB options:
default['openhab']['my']['version'] = '1.4.0'

