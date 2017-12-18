class wordpress::install inherits wordpress {
package { "apache2" : ensure => installed }
package { "php5" : ensure => installed }
package { "mysql-server" : ensure => installed }
package { "php5-mysql" : ensure => installed }
package { "libapache2-mod-php5" : ensure => installed }
package { "php5-mcrypt" : ensure => installed }
package { "unzip" : ensure => installed }
}
