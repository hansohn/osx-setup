#!/usr/bin/env bash

# ----- XCODE TOOLS -----
# check for xcode tools, install if missing
if ! xcode-select --version > /dev/null 2>&1; then
  sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access VALUES('kTCCServiceAccessibility','com.apple.ScriptEditor.id.xcode-tools-installer',0,1,1,NULL)";
  open ./xcode-tools-installer.app;
fi

# ----- VUNDLE -----
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
vim +PluginInstall '+source ~/.vimrc' +qall;

# -----HOMEBREW -----
which brew > /dev/null 2>&1 ||
  sudo ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

#### DEVELOPMENT ####

# ----- OPENSSL -----
brew ls | grep '^openssl$' > /dev/null 2>&1 ||
  brew install makedepend;
  brew install openssl;

# ----- WGET -----
brew ls | grep '^wget$' > /dev/null 2>&1 ||
  brew install wget; 

# ----- GIT -----
FULL_NAME="";
EMAIL_ADDRESS="";

# install GIT from homebrew
brew ls | grep '^git$' > /dev/null 2>&1 ||
  brew install git --with-brewed-openssl;

# configure GIT
if [ ! -f ~/.gitconfig ] > /dev/null 2>&1; then
  git config --global user.name $FULL_NAME
  git config --global user.email $EMAIL_ADDRESS
  git config --global core.editor vim
fi

# install git-flow
brew ls | grep '^git-flow$' > /dev/null 2>&1 ||
  brew install git-flow;

# ----- BREW-CASK -----
brew ls | grep '^brew-cask$' > /dev/null 2>&1 ||
  brew install caskroom/cask/brew-cask;

# ----- VIRTUALBOX -----
HOMEBREW_CASK_OPTS="--appdir=/Applications";

# install VIRTUALBOX
if ! brew cask ls | grep '^virtualbox$' > /dev/null 2>&1; then
  sudo brew cask install virtualbox --appdir=/Applications;
fi

# ----- VAGRANT -----
HOMEBREW_CASK_OPTS="--appdir=/Applications";

# install VAGRANT
if ! brew cask ls | grep '^vagrant$' > /dev/null 2>&1; then
  brew cask install vagrant --appdir=/Applications;
fi

# vagrant-manager
brew cask ls | grep '^vagrant-manager$' > /dev/null 2>&1 ||
  brew cask install vagrant-manager --appdir=/Applications;

# vagrant-berkshelf
vagrant plugin list | grep '^vagrant-berkshelf\s.*$' > /dev/null 2>&1 ||
  vagrant plugin install vagrant-berkshelf;

# vagrant-omnibus
vagrant plugin list | grep '^vagrant-omnibus\s.*$' > /dev/null 2>&1 ||
  vagrant plugin install vagrant-omnibus;

# vagrant-winrm
if ! vagrant plugin list | grep '^vagrant-winrm$' > /dev/null 2>&1; then
  gem install nokogiri;
  vagrant plugin install vagrant-winrm;
fi
# vagrant box - opscode-centos-6.5
vagrant box list | grep '^opscode-centos-6.5\s.*$' > /dev/null 2>&1 ||
  vagrant box add --name opscode-centos-6.5 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box;

# vagrant box - opscode-centos-6.6
vagrant box list | grep '^opscode-centos-6.6\s.*$' > /dev/null 2>&1 ||
  vagrant box add --name opscode-centos-6.6 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box;

# ----- CHEFDK -----
if ! brew cask ls | grep '^chefdk$' > /dev/null 2>&1; then
  brew cask install chefdk --appdir=/Applications;
  source ~/.bash_profile;
  # knife
  openssl genrsa 2048 > ~/.chef/${USER}-local.pem;
  knife configure --defaults --key "`echo ~`/.chef/${USER}-local.pem" --repository "";
fi

# kitchen.yml
CHEFDK_TMPL_DIR="/opt/chefdk/embedded/apps/chef-dk/lib/chef-dk/skeletons/code_generator/templates/default/";

if cat ${CHEFDK_TMPL_DIR}/kitchen.yml.erb.orig > /dev/null 2>&1; then
  sudo sed -i '.orig' -e '/  - name: ubuntu-12.04/d' $CHEFDK_TMPL_DIR/kitchen.yml.erb;
fi

# ----- PACKER -----
PACKER_DIR="`brew cask info packer | grep "/homebrew-cask/Caskroom/packer/" | awk '{print $1}'`";
PACKER_WIN_PLGNS="packer-community/packer-windows-plugins/releases/download/pre-release/darwin_amd64.zip";  #packer-community/packer-windows-plugins

if ! brew cask ls | grep '^packer$' > /dev/null 2>&1; then
    sudo brew cask install packer --appdir=/Applications;
    sudo curl -L https://github.com/${PACKER_WIN_PLGNS} > /tmp/darwin_amd64.zip;
    sudo unzip -x /tmp/darwin_amd64.zip -d ${PACKER_DIR};
    sudo chown root:wheel ${PACKER_DIR}/*
    sudo rm -f /tmp/darwin_amd64.zip;
fi

# ruby gems
gem list --local | grep '^serverspec$' ||
  gem install serverspec;

# ----- GOLANG -----
if ! brew list ls | grep '^go$' > /del/null 2>&1; then
  brew install go --with-cc-common;
fi

#### Applications ####

# zsh
brew cask ls | grep '^zsh$' > /dev/null 2>&1 ||
  brew install zsh;

# iterm2
brew cask ls | grep '^iterm2$' > /dev/null 2>&1 ||
  brew cask install iTerm2 --appdir=/Applications;

# atom
! which atom > /dev/null 2>&1 ||
  brew cask install Atom --appdir=/Applications;
