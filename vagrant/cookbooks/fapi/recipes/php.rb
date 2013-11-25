package "php-devel" do
  action :nothing
end

package "php" do
  not_if "which php"
  action :install
  notifies :install, "package[php-devel]", :immediately
end

package "php-mbstring" do
  not_if "php -m | grep mbstring"
  action :install
end

package "php-pear" do
  not_if "which pecl"
  action :install
end

bash "php-xdebug" do
  not_if "php -m | grep Xdebug"
  user "root"
  code <<-EOH
    pecl install xdebug
  EOH
end

bash "php-mcrypt" do
  not_if "php -m | grep mcrypt"
  user "root"
  code <<-EOH
    yum -y install php-mcrypt
  EOH
end

# package "php-pecl-xhprof" do
#   not_if "php -m | grep xhprof"
#   version "0.9.2-5.el6"
#   action :install
# end

bash "mongo_extension" do
  not_if "php -m | grep mongo"
  user "root"
  cwd "/tmp"
  code <<-EOH
    git clone https://github.com/mongodb/mongo-php-driver.git
    cd mongo-php-driver
    git checkout 1.2.10
    phpize && ./configure && make && make install
    service httpd restart
  EOH
end

#package "php-phpunit-PHPUnit" do
#  not_if "which phpunit"
#  action :install
#end

template "/etc/php.d/xdebug.ini" do
  source "xdebug.ini.erb"
  mode 0744
end

template "/etc/php.d/mongo.ini" do
  source "mongo.ini.erb"
  mode 0744
end

template "/etc/php.d/memcached.ini" do
  source "memcached.ini.erb"
  mode 0744
end

template "/etc/php.d/fapi.ini" do
  source "php.ini.erb"
  mode 0744
end
