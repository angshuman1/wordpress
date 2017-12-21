class wordpress::web {
#exec { "downloadwordpress" :
#                   command => "wget https://wordpress.org/latest.zip && touch /tmp/fil4",
#                   path => "/usr/bin",
#                  cwd => "/var",
#                   creates => "/tmp/fil4",

file { "/etc/latest.zip" : source => "puppet:///modules/wordpress/latest.zip }

exec { "unzipwordpress" :
            command => "unzip /var/latest.zip && touch /tmp/file5",
            path => "/usr/bin",
            creates => "/tmp/file5",
            cwd => "/var",
            require => Exec['downloadwordpress'],
}
exec { "copywordpress" :
                  command => "cp -R /var/wordpress/* /var/www/html && touch /tmp/file6",
                  path => "/bin",
                  creates => "/tmp/file6",
                  require => Exec['unzipwordpress'],
}

#exec { "configurewordpress" :
#               command => "wget https://raw.githubusercontent.com/roybhaskar9/chefwordpress-1/master/wordpress/files/default/wp-config-sample.php -O wp-config.php && touch /tmp/file7",
#               path => "/usr/bin",
#               cwd => "/var/www/html",
#               require => Exec['copywordpress'],

file { "/etc/wp-config.php" : source => "puppet///modules/wordpress/wp-config.php }


file  { "/var/www/html/index.html" :
                            ensure => absent,
                            require => Service['apache2'],
}
exec { "service apache2 restart" :
                     require => Exec['configurewordpress'],
}    
