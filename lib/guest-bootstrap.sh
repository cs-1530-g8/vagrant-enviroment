#!/usr/bin/env bash

source lib/functions.sh

installRVM()
{
  dx_step "Installing Ruby Version Manager (RVM)"
  curl -L https://get.rvm.io | bash -s stable
  source /home/vagrant/.rvm/scripts/rvm

  RUBY_VERSION="2.1.1"

  dx_step "Installing Ruby ${RUBY_VERSION}"
  rvm install ${RUBY_VERSION} --verify-downloads 1
  rvm default ${RUBY_VERSION}
}

cloneRepo()
{
  dx_step "Cloning orgman Ruby on Rails repo"
  git clone https://github.com/cs-1530-g8/orgman.git
}

setupRepo(){
  dx_step "Setting up pittdeltachi.com Ruby on Rails"
  cd orgman

  source /home/vagrant/.rvm/scripts/rvm

  dx_step "Installing Gems"
  gem install bundler
  bundle install

  if ! [ -f /vagrant/orgman/config/database.yml ]
  then
    dx_step "Setup config files"
    cp config/database.yml.dev config/database.yml
  fi

  rake db:migrate RAILS_ENV=development
}

installRVM
cloneRepo
setupRepo
