# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'

Vagrant.configure("2") do |config|
  config.vm.box = "generic/fedora38"
  config.vm.provider :libvirt do |v|
    v.driver = "kvm"
    v.memory = 2048
    v.cpus = 2
  end

  # Install necessary tools
  config.vm.provision "shell", inline: <<-SHELL
    curl -sSL https://raw.githubusercontent.com/shypard/dotfiles/main/install-packages.sh | bash
    curl -sSL https://raw.githubusercontent.com/shypard/dotfiles/main/install-dotfiles.sh | bash
    reboot
  SHELL
end
