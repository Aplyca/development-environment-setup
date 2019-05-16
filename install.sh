#!/bin/bash
# Install OS X software

# Install Homebrew
if grep -q 'brew' <<< "$(command -v brew)"; then
    echo "Homebrew already installed";
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Isntall CLI packages
brew install bash make zsh zsh-completions antigen git neovim tig wget lynx httpie xz tmate;

# Install GUI packages
brew cask install hyper google-chrome visual-studio-code docker;

# Install VSCode packages
code --install-extension bungcip.better-toml --install-extension cssho.vscode-svgviewer --install-extension dawhite.mustache --install-extension dbaeumer.vscode-eslint --install-extension eamodio.gitlens --install-extension esbenp.prettier-vscode --install-extension felixfbecker.php-intellisense --install-extension HookyQR.beautify --install-extension imperez.smarty --install-extension junstyle.php-cs-fixer --install-extension KnisterPeter.vscode-commitizen --install-extension mikestead.dotenv --install-extension PeterJausovec.vscode-docker --install-extension shanoor.vscode-nginx --install-extension stevejpurves.cucumber --install-extension sysoev.language-stylus --install-extension whatwedo.twig --install-extension wholroyd.jinja --install-extension yzhang.markdown-all-in-one

# Install Hyper packages
hyper i hyper-one-dark hypercwd hyperlinks hyper-tabs-enhanced hyper-autohide-tabs hyper-pane

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
# plugins=(git httpie web-search docker zsh-syntax-highlighting)

# Enable Zsh shell
chsh -s $(which zsh);

#Create your projects folder
mkdir -p ~/projects;
