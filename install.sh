#!/bin/bash
# Install OS X software

# Install Homebrew
if grep -q 'brew' <<< "$(command -v brew)"; then
    echo "Homebrew already installed";
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Isntall CLI packages
brew install bash make zsh zsh-completions antigen git vim tig wget lynx httpie xz;

# Install GUI packages
brew cask install hyper google-chrome atom;

# Install Atom packages
apm install file-icons atom-beautify docblockr highlight-selected linter markdown-preview-plus linter-ui-default language-apache atom-jinja2 language-terraform autocomplete-ansible ansible-vault language-varnish language-nginx fonts emmet linter-scss-lint php-cs-fixer php-twig linter-ui-default pigments fonts svg-preview language-ezlegacy stylus;

# Install Hyper packages
# PLugin manager for Hyper deprecated
#hpm i hyper-one-dark hypercwd hyperlinks hyperterm-tabs

# Cleaning up disk space
brew cleanup;

# Configure Git
echo "Do you want to configure Git[y/n]"
read git;
if [ -z "${git}" ] || [ $git = "y"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/macOS-environment/master/configure_git.sh)";
fi

# install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;

# Enable Zsh plugins
# plugins=(git vagrant httpie web-search docker zsh-syntax-highlighting)

# Enable Zsh shell
chsh -s $(which zsh);

#Create your projects folder
mkdir -p ~/projects;
