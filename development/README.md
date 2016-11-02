# Development Deployment Guide

1. Install <http://vagrantup.com/>
2. Clone this repo
3. **Go into the `development` directory**
4. Look into the `roles` directory and create a new role using the `example.rb` role as the base and making any required changes.
4. Open `Vagrantfile` and look for the line `chef.add_role('example')`, change the role name to the newly created one.
5. Run `vagrant up`.
6. Go to <http://localhost:3000> in your browser.

Run `vagrant ssh` to access your VM.

For more information on the commands you can use with Vagrant take a look at:
<https://www.vagrantup.com/docs/cli/>

And for more information about Chef take a look at:
<https://www.chef.io/>