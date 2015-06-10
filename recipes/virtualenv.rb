include_recipe 'python'

cookbook_file node[:wal_e][:virtualenv][:helper] do
  source 'virtualenvhelper.sh'
  path   node[:wal_e][:virtualenv][:helper]
  owner  node[:wal_e][:user]
  mode 0755
  action :create
end

directory node[:wal_e][:virtualenv][:path] do
  owner node[:wal_e][:user]
  group node[:wal_e][:group]
  recursive true
  action :create
end

python_virtualenv node[:wal_e][:virtualenv][:path] do
  options '--no-site-packages'
  owner node[:wal_e][:user]
  group node[:wal_e][:group]
  action :create
end

