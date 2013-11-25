package "mysql-server" do
    action [:install]
end

service "mysqld" do
    action [:enable,:start]
end

bash "setup_mysql" do
  user "root"
  code <<-EOH
    mysql -u root -e 'create database fapi_local_fx'
    mysql -u root -e 'grant all privileges on fapi_local_fx.* to fapi_local_fx@localhost identified by "fapi_local_fx"'
    mysql -u root -e 'create database fapi_test_fx'
    mysql -u root -e 'grant all privileges on fapi_test_fx.* to fapi_test_fx@localhost identified by "fapi_test_fx"'
    mysql -u root -e 'create database fapi_behat_fx'
    mysql -u root -e 'grant all privileges on fapi_behat_fx.* to fapi_behat@localhost identified by "fapi_behat"'
    
    mysql -u root -e 'create database fapi_local_vod'
    mysql -u root -e 'grant all privileges on fapi_local_vod.* to fapi_local_vod@localhost identified by "fapi_local_vod"'
    mysql -u root -e 'create database fapi_test_vod'
    mysql -u root -e 'grant all privileges on fapi_test_vod.* to fapi_test_vod@localhost identified by "fapi_test_vod"'
    mysql -u root -e 'create database fapi_behat_vod'
    mysql -u root -e 'grant all privileges on fapi_behat_vod.* to fapi_behat@localhost identified by "fapi_behat"'

    mysql -u root -e 'create database fapi_local_fxm'
    mysql -u root -e 'grant all privileges on fapi_local_fxm.* to fapi_local_fxm@localhost identified by "fapi_local_fxm"'
    mysql -u root -e 'create database fapi_test_fxm'
    mysql -u root -e 'grant all privileges on fapi_test_fxm.* to fapi_test_fxm@localhost identified by "fapi_test_fxm"'
    mysql -u root -e 'create database fapi_behat_fxm'
    mysql -u root -e 'grant all privileges on fapi_behat_fxm.* to fapi_behat@localhost identified by "fapi_behat"'

  EOH
end
