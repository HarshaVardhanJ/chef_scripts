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

template '/var/www/html/index.html' do
	source 'index.html.erb'
	mode '0644'
end

