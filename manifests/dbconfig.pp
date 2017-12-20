class wordpress::dbconfig inherits wordpress {
exec { "setuprootpassword" :
                       command => "mysqladmin -u root password abcd1234 && touch /tmp/file1",
                       path => "/usr/bin",
                       creates => "/tmp/file1",
                       require => Service['mysql'],
                       before => Exec['runmysqlcommand'],
}
exec { "downloadmysqlcommand" :
        command => "wget https://raw.githubusercontent.com/roybhaskar9/chefwordpress-1/master/wordpress/files/default/mysqlcommands && touch /tmp/file2",
        path => "/usr/bin",
        cwd => "/var",
        creates => "/tmp/file2",
}
exec { "runmysqlcommand" :
                 command => "mysql -uroot -pabcd1234 < /var/mysqlcommands && touch /tmp/file3",
                 path => "/usr/bin",
                 creates => "/tmp/file3",
                 require => Exec['downloadmysqlcommand'],
}
}
