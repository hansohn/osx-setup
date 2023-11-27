#!/usr/bin/env bash

# the bash_profile config below is for use with osx and
# assumes that 3rd party applications were installed with
# homebrew when available.

export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

#------------------------------------------------------------------------------
# LOCALE
#------------------------------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#------------------------------------------------------------------------------
# APPLICATIONS
#------------------------------------------------------------------------------

# -- homebrew --
# install brew cask application in global /Applications directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
BREW_PREFIX=$(brew --prefix);

# -- anaconda --
# populate bash path with anaconda binaries
if [ -d "/usr/local/anaconda3" ]; then
  export PATH="${PATH}:/usr/local/anaconda3/bin";
  eval "$(register-python-argcomplete conda)";
  #source "${BREW_PREFIX}/anaconda3/etc/profile.d/conda.sh";
fi

# -- miniconda --
# populate bash path with anaconda binaries
if [ -d "${BREW_PREFIX}/Caskroom/miniconda" ]; then
  eval "$(register-python-argcomplete conda)";
  source "${BREW_PREFIX}/Caskroom/miniconda/base/etc/profile.d/conda.sh";
fi

# -- cassandra --
# populate bash path with cassandra binaries
if [ -d "/opt/dsc-cassandra/current/bin" ]; then
  export PATH="/opt/dsc-cassandra/current/bin:${PATH}"
fi

# -- chefdk --
# populate bash path with chefdk binaries
if brew ls | grep -qe '^chefdk$'; then
  eval "$(chef shell-init bash)";
  export EDITOR="VIM";
fi

# -- curl --
if [ -d "/usr/local/opt/curl/bin" ]; then
  export PATH="/usr/local/opt/curl/bin:${PATH}"
fi

# -- go_lang --
# populate path with go_lang binaries
if [ -d "/usr/local/opt/go/libexec/bin" ] ; then
  export PATH="${PATH}:/usr/local/opt/go/libexec/bin";
  export GOPATH="${HOME}/Code/go";
  export GOBIN="${GOPATH}/bin";
fi

# -- hadoop --
if [ -d "/usr/local/Cellar/hadoop" ]; then
  export HADOOP_VERSION="$(brew list --versions hadoop | awk '{ print $2 }')";
  export HADOOP_HOME="/usr/local/Cellar/hadoop/${HADOOP_VERSION}";
  export HADOOP_CONF_DIR="${HADOOP_HOME}/libexec/etc/hadoop";
fi

# -- hashicorp --
#export ATLAS_TOKEN="";
#export ATLAS_USERNAME="";
#export PACKER_LOG="DEBUG";
export VAGRANT_DEFAULT_PROVIDER="virtualbox";

# -- iterm --
if [ -f "${HOME}/.iterm2_shell_integration.bash" ]; then
  source "${HOME}/.iterm2_shell_integration.bash";
fi

# -- java --
if [ -f "/usr/libexec/java_home" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home);
  export JRE_HOME="${JAVA_HOME}/jre";
  export PATH="${JAVA_HOME}/bin:${PATH}";
fi

# -- nodejs --
if [ -f "${BREW_PREFIX}/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="${HOME}/.nvm";
  source "${BREW_PREFIX}/opt/nvm/nvm.sh";
fi

# -- openssl --
if [ -d "/usr/local/opt/openssl" ]; then
  export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"
fi

#------------------------------------------------------------------------------
# BASH COMPLETION
#------------------------------------------------------------------------------

# -- bash_completion --
if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
  source "${BREW_PREFIX}/etc/bash_completion";
fi

# -- git --
if [ -f ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-completion.bash ]; then
  source "${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-completion.bash";
fi

# -- git-flow --
if [ -f ${BREW_PREFIX}/opt/git-flow/etc/bash_completion.d/git-flow-completion.bash ]; then
  source "${BREW_PREFIX}/opt/git-flow/etc/bash_completion.d/git-flow-completion.bash";
fi

#------------------------------------------------------------------------------
# SHELL MODS
#------------------------------------------------------------------------------

# git
# display git branch info within PS1
if [ -f ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh ]; then
  source "${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh";
  export GIT_PS1_SHOWDIRTYSTATE=true;
  export GIT_PS1_SHOWUPSTREAM="verbose";
  export GIT_PS1_DESCRIBE_STYLE="branch";
  export GIT_PS1_SHOWCOLORHINTS=true;
  PROMPT_COMMAND='__git_ps1 "\u@\h[\w]" "\\\$ "';
fi

#------------------------------------------------------------------------------
# ALIASES
#------------------------------------------------------------------------------

# -- cache --
alias flushcache="dscacheutil -flushcache"                        # Flush cache

# -- disk --
alias disk='du -hd 1'                                             # Disk usage
alias fs="stat -f '%z bytes'"                                     # File size

# -- dns --
alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder" # Flush DNS cache
alias hostfile='sudo vim /etc/hosts'                              # Edit Hostfile

# -- firewall --
alias showBlocked='sudo ipfw list'                                # All ipfw rules inc/ blocked IPs

# -- homebrew --
alias fixbrew='sudo chown -R ${USER}:admin /usr/local'            # OSX constantly brakes file permissions

# -- networking --
#alias wmip="dig +short myip.opendns.com @resolver1.opendns.com"   # Get external IP (whats my ip)
alias wmip='curl ipinfo.io'                                       # Get external IP (whats my ip)
alias ip="ifconfig | awk '/inet / { print \$2 }'"                 # Get all local IPs
alias netCons='lsof -i'                                           # Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P'                           # Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'                 # Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'                 # Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'                            # Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'                            # Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'                      # All listening connections

# -- paste commands --
fun_clip() { cat $1 | pbcopy; }
alias clip=fun_clip

# -- preferred commands --
alias cp='cp -iv'                                                 # Preferred 'cp'
alias df="df -h"                                                  # Preferred ‘df’
alias grep='grep --color=auto --exclude-dir=\.git'                # Preferred ‘grep’
alias less='less -FSRXc'                                          # Preferred 'less'
alias ll='ls -Glh'                                                # Preferred ‘ll’
alias ls='ls -G'                                                  # Preferred ‘ls’
alias mv='mv -iv'                                                 # Preferred ‘mv’
alias mkdir='mkdir -pv'                                           # Preferred ‘mkdir’

# -- ssh --
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy"                    # Copy my public key to the pasteboard

# -- time --
alias utc='date -u'                                               # UTC time

# -- trash --
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl" # Empty the Trash on all mounted volumes and the main HDD
