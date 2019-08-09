#!/bin/bash

# Install Homebrew for managing brew based dependencies
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup / Update OpenSSL for Fastlane 
brew update && brew upgrade openssl

# Install RVM
curl -sSL https://get.rvm.io | bash

# Setup / Update OpenSSL for Fastlane 
rvm osx-ssl-certs update all

# Setup the correct Ruby version required for Fastlane
rvm reinstall ruby-2.2.3 --with-openssl-dir=/usr/local
rvm use ruby-2.2.3

# Install bundler gem for managing Ruby based dependencies (e.g. CocoaPods)
sudo gem install bundler

# Install Ruby based dependencies in the Gemfile (e.g. CocoaPods)
bundle install
