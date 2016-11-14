
# List of packages WAL-E needs
pkg_dependencies = %w(
  daemontools
  libevent-dev
  libssl-dev
  libxslt-dev
  lzop
  postgresql-client
  pv
  python-dev
  python-setuptools
)

# Handle older Ubuntu that had a different name
if node['platform'] == 'ubuntu' && node['platform_version'].to_f < 10.10
  pkg_dependencies.push 'git-core'
else
  pkg_dependencies.push 'git'
end

default[:wal_e][:packages] = pkg_dependencies

default[:wal_e][:pips] = %w(
  cryptography
  gevent>=0.13.1
  boto>=2.6.0
  azure>=0.7.0
  python-swiftclient>=1.8.0
  python-keystoneclient>=0.4.2
)

default[:wal_e][:install_method]      = 'source'
default[:wal_e][:repository_url]      = 'https://github.com/wal-e/wal-e.git'

default[:wal_e][:version]             = '0.8.0'
default[:wal_e][:git_version]         = "v#{wal_e[:version]}"

default[:wal_e][:env_dir]             = '/etc/wal-e'
default[:wal_e][:aws_access_key]      = ''
default[:wal_e][:aws_secret_key]      = ''
default[:wal_e][:s3_prefix]           = ''

default[:wal_e][:base_backup][:disabled]  = false
default[:wal_e][:base_backup][:minute]  = '0'
default[:wal_e][:base_backup][:hour]    = '0'
default[:wal_e][:base_backup][:day]     = '*'
default[:wal_e][:base_backup][:month]   = '*'
default[:wal_e][:base_backup][:weekday] = '1'

default[:wal_e][:base_backup][:options] = nil

default[:wal_e][:user]                = 'postgres'
default[:wal_e][:group]               = 'postgres'
default[:wal_e][:pip_user]            = 'root'
default[:wal_e][:pgdata_dir]          = '/var/lib/postgresql/9.1/main/'
