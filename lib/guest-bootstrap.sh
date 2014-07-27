#!/usr/bin/env bash

source lib/functions.sh

installRVM()
{
  dx_step "Installing Ruby Version Manager (RVM)"
  curl -L https://get.rvm.io | bash -s stable
  source /home/vagrant/.rvm/scripts/rvm

  RUBY_VERSION="2.0.0-p353"

  dx_step "Installing Ruby ${RUBY_VERSION}"
  rvm install ${RUBY_VERSION} --verify-downloads 1
  rvm default ${RUBY_VERSION}
}

cloneRepo()
{
  dx_step "Cloning pittdeltachi.com Ruby on Rails repo"
  git clone https://github.com/pitt-delta-chi/pittdeltachi.com-RoR.git
}

setupRepo(){
  dx_step "Setting up pittdeltachi.com Ruby on Rails"
  cd pittdeltachi.com-RoR

  source /home/vagrant/.rvm/scripts/rvm

  dx_step "Installing Gems"
  gem install bundler
  bundle install

  dx_step "Setup config files"
  cp config/database.yml.dev config/database.yml

  rake db:migrate RAILS_ENV=development
}

installRVM
cloneRepo
setupRepo
