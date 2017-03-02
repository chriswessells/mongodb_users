# mongodb_users

master: [![Build Status](https://travis-ci.org/chriswessells/mongodb_users.svg?branch=master)](https://travis-ci.org/chriswessells/mongodb_users) 
develop: [![Build Status](https://travis-ci.org/chriswessells/mongodb_users.svg?branch=develop)](https://travis-ci.org/chriswessells/mongodb_users)

## Description
I needed a cookbook to add an admin user when setting up a MongoDB server for the first time.  I found a specific commit for the [mongodb3](https://github.com/sunggun-yu/chef-mongodb3)
cookbook that Amsdard [@amsdard](https://github.com/amsdard) wrote. I started by forking mongodb3 and creating a resource then trying to get the code to pass the tests.
I was unsuccessful.  I am starting with Amsdard's work on users.rb in [mongodb3](https://github.com/sunggun-yu/chef-mongodb3).

## Configure an admin user after installing MongoDB
* Create an admin user 
* Specify the username and password

### Usage
After running the [mongodb3](https://github.com/sunggun-yu/chef-mongodb3) cookbook, run this cookbook to add the first user.

### Contributors
* Chris Wessells [@chriswessells](https://github.com/chriswessells)

## Supported Platforms

The following platforms have been tested

* Ubuntu 14.04
* Ubuntu 16.04

### MongoDB versions
* 3.2

### Chef Versions
* Master
* 12.18.31
* 12.17.44

## Future Features
* Create Opslog users
* Add a first collection
* Add users to that collection