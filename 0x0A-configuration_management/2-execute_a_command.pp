# Puppet manifest to install Flask from pip3

exec { 'killmenow':
  command     => '/usr/bin/pkill -f killmenow',
  path        => ['/usr/bin'],
  onlyif      => '/usr/bin/pgrep -f killmenow',
  refreshonly => true,
}
