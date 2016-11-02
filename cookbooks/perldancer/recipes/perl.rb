
include_recipe "perlbrew"
include_recipe "perlbrew::profile"

package 'build-essential'

package 'libssl-dev' do
  options '--yes'
end

package 'expat' do
  options '--yes'
end

package 'libexpat1-dev' do
  options '--yes'
end

package 'libssl-dev' do
  options '--yes'
end

package 'libmysqlclient-dev' do
  options '--yes'
end

package 'libdbd-mysql-perl' do
  options '--yes'
end

perlbrew_cpanm 'Modern Perl modules' do
  modules node['perldancer']['perl_modules']
  perlbrew "perl-#{node['perldancer']['perl_version']}"
end
