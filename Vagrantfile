# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.network "forwarded_port", guest: 8080,  host: 8080
  config.vm.define "deg" do
    config.vm.provider "docker" do |d|
      d.build_dir = "."
    end
  end
end
