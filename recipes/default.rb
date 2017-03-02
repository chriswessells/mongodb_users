#
# Cookbook:: mongodb_users
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

mongodb_users_add node['mongodb']['admin']['user'] do
  password node['mongodb']['admin']['password']
  database node['mongodb']['admin']['database']
  action :create
end
