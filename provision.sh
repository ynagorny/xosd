#!/usr/bin/env bash

sudo apt-get update

# the library the gem exists for and dependencies
apt-get install -y libxosd2 build-essential

# ruby-dev is required for ffi gem to install
apt-get install -y ruby ruby-dev

gem install bundler
