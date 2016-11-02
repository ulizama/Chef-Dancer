# Production Deployment Guide

### Install Vagrant

For easy deployment into EC2 we use [Vagrant](http://vagrantup.com/) and the [vagrant-aws](https://github.com/mitchellh/vagrant-aws) plugin.

After installing <http://vagrantup.com/> correctly, install the plugin:

`vagrant plugin install vagrant-aws`

### Setting up AWS

To be able to automatically create your instances on EC2, there are some steps you need to do:

**1. Create a new Access Key**

Create your Access Key with permissions to manage your EC2 instances. [More information](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

Once you have your key, copy the contents of [`aws`](./aws) *(so you don't commit your security details)* into a new directory called `.aws` and modify the `credentials` file with your access credentials.

**2. Create a Security Group with SSH, HTTP and HTTPS Access**

You need a security group that you will use when generating your instances that will allow access to the instance for SSH, HTTP and optionally to HTTPS. [More information](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html)

**3. Register a Key Pair to SSH into the server using a key**

Create a new private SSH key and register it on your EC2 console. Vagrant will be using this key to securely SSH into the server. [More information](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

**4. Create your server role**

Look into the `roles` directory and create a new role using the [`example.rb`](./roles/example.rb) role as the base and making any required changes.

Don't forget to add the new role into `.gitignore` so you don't commit any sensible information.

**5. Edit `Vagrantfile`**

Open [`Vagrantfile.txt`](./Vagrantfile.txt) and look for the line `chef.add_role('example')`, change the role name to the newly created one.

Edit the `aws` settings to match your requirements, for more information of what other settings you can use look at the [vagrant-aws documentation](https://github.com/mitchellh/vagrant-aws)

Rename the file to `Vagrantfile`

**6. Deploy to EC2**

Run

`vagrant up  --provider=aws`

## More Information

For more information on the commands you can use with Vagrant take a look at:
<https://www.vagrantup.com/docs/cli/>

For more information about `vagrant-aws` look at:
<https://github.com/mitchellh/vagrant-aws>

And for more information about Chef take a look at:
<https://www.chef.io/>