#
# Cookbook Name:: notepad-pp
# Recipe:: default
#
# Copyright 2015, Goldver
#
# All rights reserved - Do Not Redistribute
#

ver = node['notepad-pp']['version']
proxy = node['notepad-pp']['proxy']
install_dir = node['notepad-pp']['install_dir']
source = 'https://notepad-plus-plus.org/'

if ver == 'latest' 
	require "net/http"
	require "uri"
	require 'openssl'

	proxy = URI.parse(proxy) 
	uri = URI.parse(source)
	http = Net::HTTP.new(uri.host,uri.port, proxy.host, proxy.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	response = http.request(Net::HTTP::Get.new(uri.request_uri))
	response.code
	body = response.read_body
	
	tmp = body.split("\n")
	tmp = tmp.grep(/Current/)[0]
	ver = tmp.split(/v/)[1]
	ver = ver.split(/.h/)[0]
	Chef::Log.info "######  #{ver}  ##########"
end	

master_version = ver.to_i
name = 'Notepad++'
file_name = "npp.#{ver}.Installer.exe"

src = "https://notepad-plus-plus.org/repository/#{master_version}.x/#{ver}/#{file_name}"
Chef::Log.info "######  #{src}  ##########"

opt = (install_dir == 'default') ? '/S' : '/S' + ' ' + '/D=' + install_dir

# Installas package
windows_package name do
	source src
	options opt
	version ver
	action :install
	installer_type :custom
end

# Removes file after installation
cookbook_file "#{Chef::Config[:file_cache_path]}\\package\\#{file_name}" do
	action :delete
end
