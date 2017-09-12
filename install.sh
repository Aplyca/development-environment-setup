#!/bin/bash
# Install OS X software

# Install Homebrew
if grep -q 'brew' <<< "$(command -v brew)"; then
    echo "Homebrew already installed";
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Isntall CLI packages
brew update;
brew install bash python3 zsh zsh-completions antigen git ruby node vim tig wget lynx httpie ansible;
brew upgrade;

# Install GUI packages
brew cask install hyper iterm2 virtualbox vagrant google-chrome atom;

# Install Atom packages
apm install file-icons atom-beautify docblockr highlight-selected linter markdown-preview-plus linter-ui-default;

# Install Vagrant plugins
vagrant plugin install vagrant-hostmanager;

# Install Hyper package manager
npm install -g hpm-cli

# Install Hyper packages
hpm i hyper-one-light hypercwd hyperlinks hyperterm-tabs

# Upgrade pip
sudo -H pip install -U pip;

echo "Are you going to work on Development[1], Operations[2] or both[3]?"
read role;

if [ -z "${role}" ] || [ $role = "1"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/development.sh)";
elif [ -z "${role}" ] || [ $role = "2"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/operations.sh)";
elif [ -z "${role}" ] || [ $role = "3"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/development.sh)";
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/operations.sh)";
fi

# Cleaning up disk space
brew cleanup;

# Configure Git
echo "Do you want to conigure Git[y/n]"
read git;
if [ -z "${git}" ] || [ $git = "y"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/configure_git.sh)";
fi

# install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;

# Enalble Zsh plugins
# plugins=(git vagrant httpie web-search docker zsh-syntax-highlighting)


# Enable Zsh shell
chsh -s $(which zsh);
