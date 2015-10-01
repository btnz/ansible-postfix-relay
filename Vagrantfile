# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"

  config.vm.define :postfixtest do |s|
    s.vm.hostname = "postfixtest"
  end

  config.vm.provision "ansible" do |a|
      a.groups = {
        "postfix" => ["postfixtest"]
      }
      a.playbook		= "site.yml"
      a.sudo			= true
      a.host_key_checking	= false
    end

end
