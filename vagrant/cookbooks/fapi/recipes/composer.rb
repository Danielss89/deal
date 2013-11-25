bash "composer" do
  not_if "which composer"
  user "root"
  code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
  EOH
end