#include_recipe "apache2"
include_recipe "simple_iptables"

['node']['apps'].each do |app|
  puts app.to_s

#  web_app domain do
#    server_name domain
#    server_aliases {}
#    docroot path
#    allow_override "All"
#  end
end

=begin
web_app "skyscanner" do
  server_name "skyscanner.net.local"
  server_aliases {}
  docroot "/projects/skyscanner/public_html"
  allow_override "All"
end

web_app "glasgow2014-crm" do
  server_name "glasgow2014-crm.local"
  server_aliases {}
  docroot "/projects/glasgow2014-crm/web"
  allow_override "All"
end
=end 

execute "install_rpm_epel" do
  command "rpm -ivh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
  not_if {::File.exists?('/etc/yum.repos.d/epel.repo')}
end

execute "install_rpm_remi" do
  command "rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
  not_if {::File.exists?('/etc/yum.repos.d/remi.repo')}
end

%w{php-mbstring php-mcrypt php-xml php-intl}.each do |pkg|
  yum_package pkg do
    action:"install" 
  end
end

%w{compass}.each do |pkg|
    gem_package pkg do
        action :install
    end
end

# Allow SSH
simple_iptables_rule "ssh" do
  rule "--proto tcp --dport 22"
  jump "ACCEPT"
end

# Allow HTTP, HTTPS
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 80",
         "--proto tcp --dport 443" ]
  jump "ACCEPT"
end

# Allow Jackrabbit/Tomcat
simple_iptables_rule "tomcat" do
  rule "--proto tcp --dport 8080"
  jump "ACCEPT"
end

# Allow MYSQL
simple_iptables_rule "mysql" do
  rule "--proto tcp --dport 3306"
  jump "ACCEPT"
end

# Allow CQ5 author / publish instances
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 4502",
         "--proto tcp --dport 4503" ]
  jump "ACCEPT"
end

