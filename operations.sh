#!/bin/bash

echo "Setting up your Operations environment...";
  
# Install CLI packages
brew install terraform awscli xz &&

# Install Atom packages
apm install language-terraform;