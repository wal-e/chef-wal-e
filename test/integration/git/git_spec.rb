describe command('wal-e version') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('0.8.0') }
end

describe command('sudo crontab -l') do
  its('stdout') { should match('0 0 \* \* 1 /usr/bin/envdir /etc/wal-e /usr/local/bin/wal-e backup-push  /var/lib/postgresql/9.1/main/') }
end
