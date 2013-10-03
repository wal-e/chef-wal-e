#
# Cookbook Name:: wal-e
# Recipe:: default

include_recipe "python::pip"

package "python-setuptools"
package "python-dev"
package "lzop"
package "pv"
package "postgresql-client"
package "libevent-dev"
package "daemontools"

python_pip "gevent"
python_pip "argparse"
python_pip "boto"

code_path = "#{Chef::Config[:file_cache_path]}/wal-e"

bash "install_wal_e" do
  cwd code_path
  code <<-EOH
    /usr/bin/python ./setup.py install
  EOH
  action :nothing
end

git code_path do
  repository "https://github.com/wal-e/wal-e.git"
  revision "v0.6.5"
  notifies :run, "bash[install_wal_e]"
end

directory node[:wal_e][:env_dir] do
  user    node[:wal_e][:user]
  group   node[:wal_e][:group]
  mode    "0550"
end

vars = {'AWS_ACCESS_KEY_ID'     => node[:wal_e][:aws_access_key],
        'AWS_SECRET_ACCESS_KEY' => node[:wal_e][:aws_secret_key],
        'WALE_S3_PREFIX'        => node[:wal_e][:s3_prefix]}

vars.each do |key, value|
  file "#{node[:wal_e][:env_dir]}/#{key}" do
    content value
    user    node[:wal_e][:user]
    group   node[:wal_e][:group]
    mode    "0440"
  end
end

cron "wal_e_base_backup" do
  user node[:wal_e][:user]
  command "/usr/bin/envdir #{node[:wal_e][:env_dir]} /usr/local/bin/wal-e backup-push #{node[:wal_e][:pgdata_dir]}"

  minute node[:wal_e][:base_backup][:minute]
  hour node[:wal_e][:base_backup][:hour]
  day node[:wal_e][:base_backup][:day]
  month node[:wal_e][:base_backup][:month]
  weekday node[:wal_e][:base_backup][:weekday]
end
