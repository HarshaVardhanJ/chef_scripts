#
# Cookbook:: lamp
# Recipe:: web
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
#
# Create the document root directory.
directory node['lamp']['web']['document_root'] do
  recursive true
end

httpd_service 'default' do
  action [:create, :start]
  mpm 'prefork'
end

httpd_config 'default' do
  source 'default.conf.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

#
#
## Add the site configuration.
#httpd_config 'default' do
#  source 'default.conf.erb'
#end
#
## Install Apache and start the service.
#httpd_service 'default' do
#  mpm 'prefork'
#  action [:create, :start]
#  subscribes :restart, 'httpd_config[default]'
#end