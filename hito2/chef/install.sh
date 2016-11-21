#!/bin/bash
vagrant ssh -c "sudo chef-solo -c /vagrant/solo.rb -j /vagrant/solo.json"
