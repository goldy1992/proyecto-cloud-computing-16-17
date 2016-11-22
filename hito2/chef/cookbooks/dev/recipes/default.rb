#
# Cookbook Name:: dev
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
name "java" 
description "Install Oracle Java" 
default_attributes( "java" => { "install_flavor" => "oracle", "jdk_version" => "7", "oracle" => { "accept_oracle_download_terms" => true } } ) run_list( "recipe[java]" ) 

package 'java' do
  action :install
end
