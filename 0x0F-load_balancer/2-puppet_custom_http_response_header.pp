# 2-puppet_custom_http_response_header.pp
# Puppet manifest to configure a custom HTTP header response

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom Nginx configuration file
file { '/etc/nginx/conf.d/custom_http_header.conf':
  ensure  => present,
  content => "add_header X-Served-By 411640-web-${hostname};\n",
  notify  => Service['nginx'],
}

# Restart Nginx service to apply changes
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/conf.d/custom_http_header.conf'],
}
