Vagrant Enviroment
=======================================
This is an automated environment for running [pittdeltachi.com Rails](https://github.com/pitt-delta-chi/pittdeltachi.com-RoR) in a VM

Vagrant Environment for pittdeltachi.com-RoR repository

Quick Start for Mac
===================
First get this repo onto your local mechine! You can either download the zip if you don't have git yet or git clone it!

- [Download The Zip](https://github.com/pitt-delta-chi/pittdeltachi.com-RoR-vagrant-enviroment/archive/master.zip)
 - Unzip it!
 - Move the folder to where you want your code to live (e.g. ~/github/)
- `git clone https://github.com/pitt-delta-chi/pittdeltachi.com-RoR-vagrant-enviroment.git`

Then run

```
cd pittdeltachi.com-RoR-vagrant-enviroment
./bootstrap.sh
vagrant ssh
cd /vagant/pittdeltachi.com-RoR
rails c
```

Visit [http://localhost:5001/](http://localhost:5001/) in your browser to see site running in VM
