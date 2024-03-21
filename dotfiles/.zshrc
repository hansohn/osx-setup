#!/usr/bin/env zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws docker doctl git terraform vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# the bash_profile config below is for use with osx and
# assumes that 3rd party applications were installed with
# homebrew when available.

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

#------------------------------------------------------------------------------
# LOCALE
#------------------------------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#------------------------------------------------------------------------------
# APPLICATIONS
#------------------------------------------------------------------------------

# enable/disable applications
ANACONDA_SHELL=false
CHEF_SHELL=false
MINICONDA_SHELL=true
NVM_SHELL=true
RUBY_USE_BREW=false


# -- homebrew --
# install brew cask application in global /Applications directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
BREW_PREFIX=$(brew --prefix);

# -- anaconda --
# populate bash path with anaconda binaries
if [ "${ANACONDA_SHELL}" = "true" ] && [ -d "/usr/local/anaconda3" ]; then
  export PATH="${PATH}:/usr/local/anaconda3/bin";
  eval "$(register-python-argcomplete conda)";
  # source "${BREW_PREFIX}/anaconda3/etc/profile.d/conda.sh";  # commented out by conda initialize
fi

# -- miniconda --
# populate bash path with anaconda binaries
if [ "${MINICONDA_SHELL}" = "true" ] && [ -d "${BREW_PREFIX}/Caskroom/miniconda" ]; then
  eval "$(register-python-argcomplete conda)";
  __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "${BREW_PREFIX}/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
      . "${BREW_PREFIX}/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
      export PATH="${BREW_PREFIX}/Caskroom/miniconda/base/bin:$PATH"
    fi
  fi
  unset __conda_setup
fi

# -- cassandra --
# populate bash path with cassandra binaries
if [ -d "/opt/dsc-cassandra/current/bin" ]; then
  export PATH="/opt/dsc-cassandra/current/bin:${PATH}"
fi

# -- chefdk --
# populate bash path with chefdk binaries
if [ "${CHEF_SHELL}" = "true" ] && brew ls | grep -qe '^chefdk$'; then
  eval "$(chef shell-init bash)";
  export EDITOR="VIM";
fi

# -- curl --
if [ -d "/usr/local/opt/curl/bin" ]; then
  export PATH="/usr/local/opt/curl/bin:${PATH}"
fi

# -- docker --
if [ -d "/usr/local/Caskroom/docker" ]; then
  export PATH="${HOME}/.docker/bin:${PATH}";
fi

# -- go_lang --
# populate path with go_lang binaries
if [ -d "/usr/local/opt/go/libexec/bin" ] ; then
  export GOROOT="/usr/local/opt/go/libexec";
  export PATH="${PATH}:${GOROOT}/bin";
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
#export PACKER_LOG="DEBUG";
export VAGRANT_DEFAULT_PROVIDER="virtualbox";

# -- iterm --
#if [ -f "${HOME}/.iterm2_shell_integration.bash" ]; then
#  source "${HOME}/.iterm2_shell_integration.bash";
#fi

# -- java --
if [ -f "/usr/libexec/java_home" ] && java -version > /dev/null 2>&1; then
  export JAVA_HOME=$(/usr/libexec/java_home);
  export JRE_HOME="${JAVA_HOME}/jre";
  export PATH="${JAVA_HOME}/bin:${PATH}";
fi

# -- nodejs --
if [ "${NVM_SHELL}" = "true" ] && [ -d "${BREW_PREFIX}/opt/n" ]; then
  export N_PREFIX="${HOME}/.n";
  export PATH=${N_PREFIX}/bin:${PATH};
fi

if [ "${NVM_SHELL}" = "true" ] && [ -f "${BREW_PREFIX}/opt/nvm/nvm.sh" ]; then
  export NVM_DIR="${HOME}/.nvm";
  source "${BREW_PREFIX}/opt/nvm/nvm.sh";
fi

# -- openssl --
if [ -d "/usr/local/opt/openssl" ]; then
  export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"
fi

# -- ruby --
if [ "${RUBY_USE_BREW}" = "true" ] && [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH="/usr/local/opt/ruby/bin:${PATH}"
fi

# -- vault --
export VAULT_ADDR=https://vault.hrt.io;

# -- gnu-getopt --
# populate bash path the gnu-getopt
if [ -d "/usr/local/opt/gnu-getopt" ]; then
  export PATH="/usr/local/opt/gnu-getopt/bin:${PATH}"
fi

#------------------------------------------------------------------------------
# BASH COMPLETION
#------------------------------------------------------------------------------

# -- bash_completion --
#if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
#  source "${BREW_PREFIX}/etc/bash_completion";
#fi

if [ -d ${BREW_PREFIX}/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# -- azure cli --
if [ -f ${BREW_PREFIX}/opt/azure-cli/etc/bash_completion.d/az ]; then
  source "${BREW_PREFIX}/opt/azure-cli/etc/bash_completion.d/az";
fi

# -- git --
#if [ -f ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-completion.bash ]; then
#  source "${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-completion.bash";
#fi

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
alias wmip="curl ipinfo.io"                                       # Get external IP (whats my ip)
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
