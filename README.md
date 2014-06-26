# Vagrant Dev

A Vagrant (www.vagrantup.com) configuration for PHP focused web development.

## To set up you need

1. Vagrant -> http://downloads.vagrantup.com/
2. Install Chef librarian -> https://github.com/applicationsonline/librarian-chef
3. Run 'librarian-chef install' to install the required chef cookbooks 
4. Run 'vagrant up' to download and provision the VM 

## What you get 

You will end up with a CentOS 6.4 VM with:

* git
* php
* apache2
* mysql (client and server)
* composer
* rubygems
* subversion 
* java
* maven 
* nodejs

## Port Mappings 

The VM is using the following port mappings:

* Apche guest: 80, host: 8080
* MySQL guest: 3306, host: 3309