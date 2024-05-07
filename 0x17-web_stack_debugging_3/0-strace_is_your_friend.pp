# Puppet manifest to fix Apache configuration issue causing a 500 error

file { '/etc/apache2/apache2.conf':
  ensure  => file,
  content => template('apache/apache2.conf.erb'), # Use a template if necessary
  # Add any other attributes as needed (e.g., owner, group, mode)
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => File['/etc/apache2/apache2.conf'],
}
