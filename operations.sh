#!/bin/bash

echo "Setting up your Operations environment...";

# Install CLI packages
brew upgrade terraform awscli xz &&

# Install Atom packages
apm install language-apache atom-jinja2 language-terraform autocomplete-ansible ansible-vault language-varnish language-nginx;
