# -*- mode: ruby -*-
# vi: set ft=ruby :

#https://gist.github.com/dbu/4064837

Vagrant.configure("2") do |config|
  config.vm.box = "centos-6.4"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "8192"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--name", "manos-dev-vm"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.network :forwarded_port, guest: 80,   host: 8080  #apache
  config.vm.network :forwarded_port, guest: 3306, host: 3309  #mysql
  config.vm.network :forwarded_port, guest: 8080, host: 8081  #tomcat

  config.vm.network :private_network, ip: "192.168.33.11"
  config.vm.synced_folder "../htdocs", "/projects", :nfs => true
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"

    #chef.add_recipe "simple_iptables"
    #chef.add_recipe "build-essential"
    #chef.add_recipe "mysql"
    #chef.add_recipe "mysql::server"
    #chef.add_recipe "git"
    #chef.add_recipe "rubygems"
    #chef.add_recipe "php"
    #chef.add_recipe "php::module_mysql"
    #chef.add_recipe "php::module_apc"
    #chef.add_recipe "php::module_curl"
    #chef.add_recipe "php::module_gd"
    #chef.add_recipe "apache2"
    #chef.add_recipe "apache2::mod_php5"
    #chef.add_recipe "apache2::mod_alias"
    #chef.add_recipe "apache2::mod_headers"
    #chef.add_recipe "apache2::mod_include"
    #chef.add_recipe "apache2::mod_proxy"
    #chef.add_recipe "apache2::mod_rewrite"
    #chef.add_recipe "apache2::mod_ssl"
    #chef.add_recipe "apache2::mod_setenvif"
    chef.add_recipe "webapp"
    #chef.add_recipe "composer"
    #chef.add_recipe "drush"
    #chef.add_recipe "drush::install_console_table"
    #chef.add_recipe "memcached"
    #chef.add_recipe "java"
    #chef.add_recipe "maven"
    #chef.add_recipe "nodejs"
#    chef.add_recipe "mongodb::10gen_repo"
#    chef.add_recipe "mongodb::default"


    chef.json = {
#      "mongodb" => {
#        "package_name" => "mongodb-10gen-server",
#        "package_version" => "2.4.0"
#      },
      :maven => {
        :setup_bin => true
      },
      :mysql => {
        :server_root_password => "webuser",
        :server_repl_password => "webuser",
        :server_debian_password => "webuser",
        :allow_remote_root => true
      },
      :java => {
          :install_flavor => "oracle",
          :jdk_version => "6",
          :oracle => {
            :accept_oracle_download_terms => true
          }
        }
    }
  end
end
