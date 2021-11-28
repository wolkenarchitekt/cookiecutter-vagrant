# -*- mode: ruby -*-
# vi: set ft=ruby :
DIST = "ubuntu"
DIST_CODENAME = "focal"
DOCKER_COMPOSE_VERSION = "1.27.4"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 8000, host: 8001

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git", ".venv"]

  config.vm.provision "shell", inline: <<-SHELL
    test -f "/usr/local/bin/docker-compose" && exit 0
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/#{DIST} #{DIST_CODENAME} stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo usermod -aG docker vagrant
    sudo curl -L "https://github.com/docker/compose/releases/download/#{DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  SHELL
end
