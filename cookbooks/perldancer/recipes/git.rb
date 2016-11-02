
#Create SSH directory
directory "/.ssh"

#Create Deploy key on github
deploy_key "app_deploy_key" do
  provider Chef::Provider::DeployKeyGithub
  path '/.ssh'
  credentials({
    :token => node['perldancer']['git_token']
  })
  repo node['perldancer']['git_repo_name']
  action :add
end

#Setup the git wrapper
file "/.ssh/git_wrapper.sh" do
  mode "0755"
  content "#!/bin/sh\nexec ssh -o \"StrictHostKeyChecking=no\" -i \"/.ssh/app_deploy_key\" $1 $2"
end

#Clone the repository
git "#{node['perldancer']['app_root']}" do
  repository "#{node['perldancer']['git_repo_url']}"
  reference "#{node['perldancer']['git_repo_branch']}"
  action :sync
  ssh_wrapper "/.ssh/git_wrapper.sh"
end

#Remove deploy key from github and local key
deploy_key "app_deploy_key" do
  action [:remove, :delete]
end

