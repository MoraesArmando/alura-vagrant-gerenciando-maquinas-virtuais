# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

# install php package
package { ['php' ,'php-mysql'] :
  require => Exec['apt-update'],
  ensure => installed,
}

# execute 'run-php'
exec { 'run-php':
  require => Package['php'],            # require 'php7.2' before installing
  command => '/usr/bin/php -S 0.0.0.0:8888 -t /vagrant/src &'
}