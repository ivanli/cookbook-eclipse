#
# Cookbook Name:: eclipse
# Recipe:: default
#
# Copyright 2015, Ivan Li
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'windows'

unless Dir.exists? node['eclipse']['out_path']

  windows_batch 'unzip eclipse' do
    code <<-EOH
      7z.exe x #{node['eclipse']['zip_path']} -o#{node['eclipse']['out_path']} -r -y
    EOH
  end

  windows_path "#{node['eclipse']['out_path']}/eclipse".gsub('/', '\\') do
    action :add
  end

  if not node['eclipse']['plugins'].empty?

    node['eclipse']['plugins'].each do |plugin_group|
      repo, plugins = plugin_group.first
      execute "eclipse plugin install #{plugins}" do
        command "eclipse -application org.eclipse.equinox.p2.director -noSplash -repository #{repo} -installIUs #{plugins}"
        action :run
      end
    end
  end
else
  Chef::Log.info "Eclipse folder already exists at #{node['eclipse']['out_path']}"
end