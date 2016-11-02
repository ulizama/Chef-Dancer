#Update package manager
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

#Install main packages
package 'vim'
package 'git'
package 'make'

#Create logs directory
directory '/data'




