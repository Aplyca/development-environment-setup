#!/bin/bash
# Install OS X software

# Install Homebrew
if grep -q 'brew' <<< "$(command -v brew)"; then
    echo "Homebrew already installed";
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Isntall CLI packages
brew update &&
brew install bash python3 zsh zsh-completions git ruby node yarn coffeescript vim tig wget lynx httpie ansible &&
brew upgrade &&

# Install GUI packages
brew cask install iterm2 virtualbox vagrant google-chrome atom &&

# Install Atom packages
apm install file-icons atom-beautify linter language-apache atom-jinja2 markdown-preview-plus linter-ui-default fonts &&

# Install Vagrant plugins
vagrant plugin install vagrant-hostmanager &&

# Upgrade pip
sudo -H pip install -U pip;

echo "Are you going to work on Development[1], Operations[2] or both[3]:"
read role;

if [ -z "${role}" ] || [ $role = "1"  ]; then
  sh -c "$(curl -fsSL https://gist.githubusercontent.com/mauricios/5f7bc2bc8d50ad85ab00c3fdfdef1d0c/raw/Install-Development-macOS.sh)";
elif [ -z "${role}" ] || [ $role = "2"  ]; then
  sh -c "$(curl -fsSL https://gist.githubusercontent.com/mauricios/5f7bc2bc8d50ad85ab00c3fdfdef1d0c/raw/Install-Operations-macOS.sh)";
elif [ -z "${role}" ] || [ $role = "3"  ]; then
  sh -c "$(curl -fsSL https://gist.githubusercontent.com/mauricios/5f7bc2bc8d50ad85ab00c3fdfdef1d0c/raw/Install-Development-macOS.sh)";
  sh -c "$(curl -fsSL https://gist.githubusercontent.com/mauricios/5f7bc2bc8d50ad85ab00c3fdfdef1d0c/raw/Install-Operations-macOS.sh)";
fi

# Configure Git
sh -c "$(curl -fsSL https://gist.githubusercontent.com/mauricios/5f7bc2bc8d50ad85ab00c3fdfdef1d0c/raw/configure_git_ssh_key.sh)" &&

# install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&

# Enable Zsh shell
chsh -s $(which zsh);