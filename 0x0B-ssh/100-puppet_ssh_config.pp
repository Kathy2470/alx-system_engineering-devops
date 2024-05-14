# Puppet manifest to configure SSH client settings

# Ensure the SSH configuration file exists
file { '/etc/ssh/ssh_config':
  ensure => present,
}

# Configure SSH to use the private key ~/.ssh/school
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '  IdentityFile ~/.ssh/school',
  match => '^.*IdentityFile.*$',
}

# Configure SSH to refuse password authentication
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '  PasswordAuthentication no',
  match => '^.*PasswordAuthentication.*$',
}
