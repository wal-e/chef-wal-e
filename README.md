WAL-E Cookbook
==============

Installs and configures [WAL-E](https://github.com/wal-e/wal-e) using
envdir to store configuration. Sets up a crontab entry to perform base
backups.
*You still need to configure Postgres manually/separately to
archive WAL files.*

(Tested on Debian/Ubuntu only - will probably break on other
distributions.)

Tested on Ubuntu 12.04 extensively.

Attributes
----------

- [:wal_e][:base_backup][:disabled] - Install wal-e but don't modify the postgres configuration or install the crontab - useful for restore-only environments.
- [:wal_e][:packages] - The packages needed by wal-e. Override if these are installed in your environment elsewhere.
- [:wal_e][:pips] - Python dependencies needed by wal-e. Override if these are installed in your environment elsewhere
- [:wal_e][:pip_user] - User to install pips under. Defaults to system. Ignored if installing wal-e in a virtualenv.

- [:wal_e][:install_method] - valid are 'source' and 'pip'
- [:wal_e][:version] - Specify the version you want to install when installing from pip
- [:wal_e][:git_version] - Specify the version you want to install when installing from source
- [:wal_e][:base_backup] - Specifies the time period to issue cron backups

- [:wal_e][:pgdata_dir] - Postgres data directory, override for your postgres version

- [:wal_e][:virtualenv][:enabled] - Set to true to install wal-e inside of a python virtual environment. Be sure to update you archive commands appropriately.

Recipes
-------

- default.rb - Installs wal-e
- virtualenv.rb - Called by default.rb if `virtualenv.enabled` is set to true

License and Authors
-------------------
Authors:

* Russ Garrett (rusis@garrett.co.uk)

Contributors:

* Issa Ashwash (iashwash@bitsighttech.com)
