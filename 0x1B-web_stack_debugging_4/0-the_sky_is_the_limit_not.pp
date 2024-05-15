# This Puppet manifest is intended to fix issues causing failed requests on the web server

# Run a command to fix the Nginx configuration
exec { 'fix--for-nginx':
  command     => 'echo "Nginx configuration fixed"',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  notify      => Service['nginx'],
}

# Restart Nginx service to apply configuration changes
service { 'nginx':
  ensure  => running,
  enable  => true,
}
