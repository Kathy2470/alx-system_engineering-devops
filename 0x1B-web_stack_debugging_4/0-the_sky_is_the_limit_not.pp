# Increase the amount of traffic an nginx server can handle

# Increase the ULIMIT of the default file
exec { 'fix-ulimit-for-nginx':
  # Modify the ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # Specify the path for the sed command
  path    => '/usr/local/bin:/bin:/usr/bin',
  # Ensure this command is executed as root
  user    => 'root',
  # Notify the nginx-restart exec to run if this command changes the file
  notify  => Exec['nginx-restart'],
}

# Restart nginx
exec { 'nginx-restart':
  # Restart nginx service
  command => '/etc/init.d/nginx restart',
  # Specify the path for init.d script
  path    => '/sbin:/bin:/usr/sbin:/usr/bin',
  # Only run this command if notified by fix-ulimit-for-nginx
  refreshonly => true,
}
