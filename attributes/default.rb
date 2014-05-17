
default[:wal_e][:packages] = [
  "python-setuptools",
  "python-dev",
  "lzop",
  "git",
  "pv",
  "postgresql-client",
  "libevent-dev",
  "daemontools"
]

default[:wal_e][:pips] = [
  "gevent",
  "argparse",
  "boto"
]

default[:wal_e][:install_method]      = 'source'
default[:wal_e][:repository_url]      = 'https://github.com/wal-e/wal-e.git'
default[:wal_e][:version]             = '0.6.5'

# DEPRECATED ATTRIBUTE, for backwards compat. Use `:version` instead
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

default[:wal_e][:user]                = 'postgres'
default[:wal_e][:group]               = 'postgres'
default[:wal_e][:pgdata_dir]          = '/var/lib/postgresql/9.1/main/'
