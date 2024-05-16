# Increase the amount of traffic an nginx server can handle

# Increase the ULIMIT of the default file
exec { 'fix-ulimit-for-nginx':
  # Modify the ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # Specify the path for the sed command
  path    => '/usr/local/bin:/bin:/usr/bin',
  user    => 'root',
  notify  => Exec['nginx-restart'],
}

# Restart nginx
exec { 'nginx-restart':
  command     => '/etc/init.d/nginx restart',
  path        => '/sbin:/bin:/usr/sbin:/usr/bin',
  # Only run this command if notified by fix-ulimit-for-nginx
  refreshonly => true,
}
