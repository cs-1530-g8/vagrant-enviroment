Vagrant Enviroment
=======================================
This is an automated environment for running [Orgman](https://github.com/cs-1530-g8/orgman) in a VM

Vagrant Environment for Orgman repository

Quick Start for Mac
===================
First get this repo onto your local mechine! You can either download the zip if you don't have git yet or git clone it!

- [Download The Zip](https://github.com/cs-1530-g8/vagrant-enviroment/archive/master.zip)
 - Unzip it!
 - Move the folder to where you want your code to live (e.g. ~/github/)
- `git clone https://github.com/cs-1530-g8/pittdeltachi.com-RoR-vagrant-enviroment.git`

Then run

```
cd vagrant-enviroment
./bootstrap.sh
vagrant ssh
cd /vagant/cs-1530-g8
rails c
```

Visit [http://localhost:3001/](http://localhost:3001/) in your browser to see site running in VM
