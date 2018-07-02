#!/bin/bash
# Install OS X software

# Install Homebrew
if grep -q 'brew' <<< "$(command -v brew)"; then
    echo "Homebrew already installed";
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Isntall CLI packages
brew install bash make zsh zsh-completions antigen git vim tig wget lynx httpie xz node;

# Install GUI packages
brew cask install hyper google-chrome atom docker;

# Install Atom packages
apm install atom-jinja2 file-icons language-apache linter pigments Stylus autocomplete-ansible fonts language-ezlegacy linter-scss-lint platformio-ide-terminal ansible-vault busy-signal highlight-selected language-nginx linter-ui-default svg-preview atom-beautify docblockr ide-php language-terraform php-cs-fixer teletype atom-ide-ui emmet intentions language-varnish php-twig zentabs

# Install Hyper packages
hyper i hyper-one-dark hypercwd hyperlinks hyper-tabs-enhanced hyper-autohide-tabs hyper-pane

# Install npm packages
npm i -g commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

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
