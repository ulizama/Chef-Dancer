
# Install daemontools
include_recipe 'daemontools'

# Create service manager
daemontools_service "app" do
  directory "/etc/sv/app"
  template "app"
  action [:enable, :start]
end
