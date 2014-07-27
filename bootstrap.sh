#!/usr/bin/env bash

source lib/functions.sh

welcome()
{
  dx_step "Lets get pittdeltachi.com RoR running"
}

checkOSXCommandLineTools()
{
  if test ! $(xcode-select -p)
  then
    dx_step "You need OSX Command Line Tools installed."
    dx_step "Rerun this script after following the GUI installer!"
    $(xcode-select --install)
    exit 0
  fi
}

checkHomebrew()
{
  if test ! $(which brew)
  then
    dx_step "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
    brew doctor
  fi
}

brewUpdate()
{
  brew update > /dev/null
}

checkBrewCask()
{
  if test ! $(brew list | grep -o "brew-cask")
  then
    brew tap caskroom/cask > /dev/null
    brew install brew-cask > /dev/null
    brewUpdate
  fi
}

checkVagrant()
{
  if test ! $(which vagrant)
  then
    dx_step "Installing Vagrant."
    checkBrewCask
    brew cask install --appdir=/Applications vagrant
  fi
}

checkVagrantPlugins()
{
  if test ! $(vagrant plugin list | grep -o "vbguest")
  then
    dx_step "Installing Vagrant Plugins."
    vagrant plugin install vagrant-vbguest
  fi
}

checkVirtualBox()
{
  if test ! $(which Virtualbox)
  then
    dx_step "Installing VirtualBox."
    checkBrewCask
    brew cask install --appdir=/Applications virtualbox
  fi
}

vagrantUp()
{
  vagrant up
}

runVMSetup(){
  dx_step "Running remaining scripts from inside the VM."
  /usr/bin/vagrant ssh -c 'cd /vagrant; ./lib/guest-bootstrap.sh'
}

createSnapshot()
{
  if test $(which VBoxManage)
  then

    dx_userInput "Do you want to take a Snapshot of the machine? [y/n]"
    read -e user_response

    if dx_true_false $user_response
    then
      dx_step "Creating VM Snapshot named 'Initial Vagrant Setup'"
      machine_id=$(<$(dirname "${BASH_SOURCE[0]}")/.vagrant/machines/default/virtualbox/id)
      VBoxManage snapshot $machine_id take "Initial Vagrant Setup"
    fi
  fi
}

welcome
checkOSXCommandLineTools
checkHomebrew
brewUpdate
checkVirtualBox
checkVagrant
checkVagrantPlugins
vagrantUp
runVMSetup
createSnapshot
