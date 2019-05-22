#!/bin/bash
# Install Ubuntu software

# Isntall CLI packages
sudo apt-get update;
sudo apt-get install bash make zsh git neovim tig wget lynx httpie tmate curl xclip -y;

# Configure Git
echo "Do you want to configure Git[y/n]"
read git;
if [ -z "${git}" ] || [ $git = "y"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Aplyca/development-environment-setup/master/configure_git.sh)";
fi

# install Oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;

# Enable Zsh plugins
# plugins=(git httpie web-search docker zsh-syntax-highlighting)

# Enable Zsh shell
chsh -s $(which zsh);

#Create your projects folder
mkdir -p ~/projects;
