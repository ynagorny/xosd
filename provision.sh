#!/usr/bin/env bash

# the library the gem exists for
apt-get install -y libxosd2

# ruby-dev is required for ffi gem to install (uncomment if not installing ruby 2.3 below)
# apt-get install -y ruby-dev

# if using RubyMine for gem development, it now needs ruby >= 2.0 for debugging

# uninstalling default ruby 1.9.3
apt-get remove -y ruby1.9.1
apt-get autoremove -y

# installing ruby 2.3 from https://www.brightbox.com/docs/ruby/ubuntu/
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
apt-get install -y ruby2.3 ruby2.3-dev

gem install bundler
