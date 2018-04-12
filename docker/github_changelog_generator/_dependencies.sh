#!/usr/bin/env bash

set -x

# AF="-yq --no-install-suggests --no-install-recommends --force-yes"
# apt-get update -qq
# apt-get -qq install ${AF} ruby
# gem install bundler

apt-get install build-essential

wget https://github.com/skywinder/github-changelog-generator/archive/master.zip
unzip master.zip
#rm master.zip
cd github-changelog-generator-master
gem build github_changelog_generator.gemspec && bundle install
gem install github_changelog_generator-1.15.0.pre.rc.gem
cd .. 
#rm -rf github-changelog-generator-master

#apt-get purge -y build-essential
#apt-get autoclean -y
#apt-get autoremove -y

github_changelog_generator --version
