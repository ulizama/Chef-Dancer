name "base"
description "base functionality to set an instance live"
run_list ["recipe[perldancer]","recipe[perldancer::git]","recipe[perldancer::perl]","recipe[perldancer::daemontools]","recipe[perldancer::nginx]"]

