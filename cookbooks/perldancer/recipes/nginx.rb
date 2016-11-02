

# Install ngingx
package 'nginx'

# Remove default configuration
file '/etc/nginx/sites-enabled/default' do
  action :delete
end

# Add new configuration for the proxy
template "/etc/nginx/sites-enabled/#{node['perldancer']['domain']}" do
  source "nginx-site.conf.erb"
  owner "root"
  group "root"
  cookbook "perldancer"
  mode 0644
  notifies :restart, "service[nginx]"
end

service "nginx"