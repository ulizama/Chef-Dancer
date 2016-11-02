name "example"
description "example configuration"
override_attributes(
    :perldancer => {
    	:nginxport => 80,
    	:dancerport => 3000,
    	:domain => 'example.com',
    	:git_token => 'Personal access token with repo access',
    	:git_repo_name => 'ulizama/MyDancerProject',
    	:git_repo_url => 'git@github.com:ulizama/MyDancerProject.git',
        :git_repo_branch => 'master',
    	:app_root => '/myproject',
    	:app_dancer_root => '/myproject/app',
    	:app_dancer_environment => 'production',
    	:perl_version => '5.18.4',
    	:perl_modules => ['Plack','Plack::Handler::Starman','Dancer','Template','DBI','DBD::mysql','Dancer::Template::TemplateToolkit','Dancer::Session::DBI','Data::Dumper','LWP::UserAgent','POSIX','Dancer::Plugin','Dancer::Plugin::Ajax','JSON',]
    },
	:perlbrew => {
		:perls => ['perl-5.18.4'],
		:install_options => '--notest --switch --noman',
		:cpanm_options => '--notest'
	}
)
run_list "role[base]"

