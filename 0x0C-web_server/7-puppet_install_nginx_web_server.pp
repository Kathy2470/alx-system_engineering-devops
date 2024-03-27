# Puppet manifest to install and configure Nginx server

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  require => Package['nginx'],
}

# Create the directory for the custom error page
file { '/usr/share/nginx/html':
  ensure => directory,
}

# Define the custom error page
file { '/usr/share/nginx/html/404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
}

# Define Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

# Define a 301 redirect
nginx::resource::vhost { 'redirect_me':
  www_root    => '/var/www/html',
  listen_port => '80',
  index_files => [],
  rewrite     => {
    'source'      => '^/redirect_me',
    'destination' => 'https://www.youtube.com/watch?v=QH2-TGUlwu4',
    'options'     => 'permanent',
  },
}
#!/usrudo sed -i '26i\       location = /error_404.html { \n               root /var/www/html; \n               internal; \n       }' /etc/nginx/sites-available/default

sudo service nginx restart

echo -e "\nCompleted.\n"

echo -e "Updating and installing Nginx.\n"
sudo apt-get update -y -qq && \
         sudo apt-get install nginx -y

echo -e "\nSetting up Nginx.\n"

sudo service nginx start

sudo ufw allow 'Nginx HTTP'

sudo chown -R "$USER":"$USER" /var/www/html
sudo chmod -R 755 /var/www

sudo cp /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian.html.bckp

echo -e "Hello World!" > /var/www/html/index.nginx-debian.html

sudo sed -i '/server_name _;/a \       rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default

sudo echo "Ceci n'est pas une page" > /var/www/html/error_404.html
sudo sed -i '25i\       error_page 404 /error_404.html;' /etc/nginx/sites-available/default
sudo sed -i '26i\       location = /error_404.html { \n               root /var/www/html; \n               internal; \n       }' /etc/nginx/sites-available/default

sudo serve "\nCompleted.\n"
