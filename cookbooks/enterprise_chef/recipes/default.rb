#
# Cookbook:: enterprise_chef
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved
# .
## Assigns the URL of the Chef Enterprise package obtained from 'attributes/default.rb' to the local variable 'package_url'.
package_url = node['enterprise_chef']['url']

## Assigns the package name obtained from the ::File.basename() method used to extract the package name from the URL.
package_name = ::File.basename(package_url)

## Since the 'package' resource does not work with URLs, the 'remote_file' resource will be used, which downloads files
## from a remote location. Also, rather than hardcoding a path like '/tmp' to save the downloaded file, Chef provides a
## variable that one should use instead:
## Chef::Config[:file_cache_path] 
## This lets Chef choose the best place to store temporary files. Pass the local path where you want to store the file as
## a string parameter to 'remote_file' or as a name attribute; in this case, we use the 'package_local_path' variable. The
## download URL should be passed to 'remote_file' as the source attribute.
package_localpath = "#{Chef::Config[:file_cache_path]}/#{package_name}"

remote_file package_localpath do
	source package_url
end

## This is the same as specifying 'action :install', as that is the default behaviour of the 'package' resource.
#package package_localpath do
#	action :install
#end
#package package_localpath

rpm_package package_name do
	source package_localpath
	notifies :run, 'execute[chef-server-ctl reconfigure]', :immediately
end

## This executes the shell command given as the argument.
execute 'chef-server-ctl reconfigure' do
	command 'chef-server-ctl reconfigure'
	action :nothing
end
