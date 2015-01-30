#!/usr/bin/env bash

echo Installing python
echo -----------------
sudo apt-get install python python-pip -y
 
echo Installing pymongo
echo ----------------
sudo pip install pymongo

echo Installing puppet
echo -----------------
sudo apt-get update
sudo apt-get install puppet -y

echo Copying all the puppet scripts
echo ------------------------------
sudo cp -r /vagrant/* /etc/puppet

echo Running puppet
echo --------------
cd /etc/puppet
sudo puppet apply -v gitserver/gitserver.pp

echo Running the New Repository Creation Deamon
echo ------------------------------------------
cp /vagrant/gitserver/new-repod.upstart.templ /etc/init/newrepo.conf
sudo service newrepo start


