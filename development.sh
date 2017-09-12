#!/bin/bash

echo "Setting up your Development environment...";

# Add PHP tap
brew tap homebrew/php &&

# Isntall CLI packages
brew update &&
brew upgrade php71 php71-intl php-cs-fixer robo composer behat codeception phpspec bower --without-apache &&
brew upgrade &&

# Install ruby packages
gem install scss_lint &&

# Install Atom packages
apm install fonts emmet linter-scss-lint php-cs-fixer php-twig linter-ui-default pigments fonts svg-preview language-ezlegacy stylus &&

# Install NodeJs packages
npm install -g gulp-cli;

# Adding Development environment
vagrant box add Aplyca/LAMP || true;
vagrant box update --box Aplyca/LAMP;
