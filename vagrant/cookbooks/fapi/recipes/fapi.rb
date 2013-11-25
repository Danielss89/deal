bash "composer" do
  user "vagrant"
  cwd "/vagrant"
  code <<-EOH
    export APPLICATION_ENV=local
    composer --verbose --dev install
  EOH
end