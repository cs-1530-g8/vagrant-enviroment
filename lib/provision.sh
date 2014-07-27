#!/usr/bin/env bash

installGit()
{
    apt-get -y update
    apt-get -y install software-properties-common python-software-properties
    add-apt-repository -y ppa:git-core/ppa
    apt-get -y update
    apt-get -y install git
}

installMiscPackages()
{
    apt-get -y install build-essential libxslt-dev libxml2-dev libcurl4-openssl-dev \
        libpq-dev imagemagick libmagickwand-dev curl openjdk-6-jdk
}

setLocale(){
    update-locale LC_ALL=en_US.utf8
}

installPhantomJS()
{
    local phantom_name=phantomjs-1.9.2-linux-x86_64

    local SCRIPT=$(cat <<EOF
    cd /home/vagrant;
    wget https://phantomjs.googlecode.com/files/${phantom_name}.tar.bz2;
    bunzip2 ${phantom_name}.tar.bz2;
    sudo tar xvf ${phantom_name}.tar -C /opt/;
    rm ${phantom_name}.tar;
    echo "export PATH=/opt/${phantom_name}/bin:\\\$PATH" >> /home/vagrant/.bash_profile;
EOF
    )
    sudo -u vagrant bash -c "$SCRIPT"
}

installNodejs()
{
    apt-get -y install python-software-properties
    add-apt-repository -y ppa:chris-lea/node.js
    apt-get update
    apt-get -y install nodejs
}

installCapybaraDependencies()
{
    apt-get -y install libqt4-dev
    apt-get -y install xvfb
}

setDisplay()
{
    echo 'export DISPLAY=:1' >> /home/vagrant/.bash_profile
}

sourceBashrc()
{
    echo 'source /home/vagrant/.bashrc' >> /home/vagrant/.bash_profile
}

addGemrc()
{
    echo '---' >> /home/vagrant/.gemrc
    echo ':update_sources: true' >> /home/vagrant/.gemrc
    echo ':verbose: true' >> /home/vagrant/.gemrc
    echo ':bulk_threshold: 100' >> /home/vagrant/.gemrc
    echo ':backtrace: false' >> /home/vagrant/.gemrc
    echo ':benchmark: false' >> /home/vagrant/.gemrc
    echo 'gem: --no-ri --no-rdoc' >> /home/vagrant/.gemrc
}

installGit
installMiscPackages
setLocale
installPhantomJS
installNodejs
installCapybaraDependencies
setDisplay
sourceBashrc
addGemrc
