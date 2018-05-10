name 'lamp'
maintainer 'Harsha Vardhan J'
maintainer_email 'vardhanharshaj@gmail.com'
license 'MIT'
description 'Installs/Configures lamp'
long_description 'Installs/Configures lamp'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
#supports 'centos'
depends 'httpd'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/lamp/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/lamp'
