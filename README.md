# Chef Dancer

This repository contains the basic cookbooks and recipes to configure a server instance running a Dancer project. The project has been tested on Ubuntu boxes successfully.

The server will be configured using [Starman](https://metacpan.org/pod/Starman), [daemontools](https://cr.yp.to/daemontools.html) and [nginx](https://www.nginx.com/).

The Dancer app will run on port *3000* which will be accessed using a proxy on nginx.

## Deployment

Currently you can either do a *development* deployment through a Vagrant VM or *production* deployment to an EC2 instance, and you can look at the details on how to do each deployment on their docs:

* [Development Deployment Guide](./development/README.md)
* [Production Deployment Guide](./production/README.md)


## The Recipes

The main cookbook that does all the work is the `perldancer` cookbook. Which will go through each recipe to setup the server. You can modify any recipe to further customize it to your needs.

### [`default`](./cookbooks/perldancer/recipes/default.rb) recipe

This will start up the package manager and install some of the basic packages required.

### [`git`](./cookbooks/perldancer/recipes/git.rb)  recipe

This will connect to Github to create a new deploy key and then clone the repository into the server.

### [`perl`](./cookbooks/perldancer/recipes/perl.rb)  recipe

The requested version of perl will be installed using perlbrew. It will install all the additional packages to be able to have MySQL support, and using cpanm it will install the module list.

### [`daemontools`](./cookbooks/perldancer/recipes/daemontools.rb)  recipe

The recipe will install daemontools as the service manager and will start up Dancer.

### [`nginx`](./cookbooks/perldancer/recipes/nginx.rb)  recipe

Install ngninx on the server and get it ready to process requests through the Dancer proxy.

## TODO

- Sync local directory with VM in development

## License

<pre>
Copyright 2015 Uriel Lizama

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>