class wordpress::service inherits wordpress{
service { "apache2" : ensure => running,
                      require => Package['apache2']
 }
service { "mysql" : ensure => running,
                    require => Package['mysql-server'],                  
}
}
