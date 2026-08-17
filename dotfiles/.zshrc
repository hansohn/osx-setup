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
plugins=(
  ansible
  aws
  docker
  doctl
  git
  helm
  kubectl
  terraform
  zsh-autosuggestions
  zsh-syntax-highlighting
)

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

# Add Homebrew completions path if Homebrew is installed
if command -v brew &>/dev/null; then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi

# Initialize completion system (only once)
autoload -Uz +X compinit bashcompinit
compinit
bashcompinit

export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

#------------------------------------------------------------------------------
# LOCALE
#------------------------------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#------------------------------------------------------------------------------
# APPLICATIONS
#------------------------------------------------------------------------------

# feature toggles
ANACONDA_SHELL=false
CHEF_SHELL=false
MINICONDA_SHELL=false
NVM_SHELL=true
RUBY_USE_BREW=false

# brew prefix only if brew is available
if command -v brew &>/dev/null; then
  BREW_PREFIX="$(brew --prefix)"
  export HOMEBREW_CASK_OPTS="--appdir=/Applications";
else
  BREW_PREFIX="/usr/local"
fi

# add directories to PATH in one place
path_add() {
  [ -d "$1" ] && PATH="$1:$PATH"
}

# anaconda
if [ "$ANACONDA_SHELL" = true ] && [ -d "/usr/local/anaconda3" ]; then
  path_add "/usr/local/anaconda3/bin"
  eval "$(register-python-argcomplete conda)"
fi

# miniconda
if [ "$MINICONDA_SHELL" = true ] && [ -d "${BREW_PREFIX}/Caskroom/miniconda" ]; then
  eval "$(register-python-argcomplete conda)"
  if [ -x "${BREW_PREFIX}/Caskroom/miniconda/base/bin/conda" ]; then
    __conda_setup="$("${BREW_PREFIX}/Caskroom/miniconda/base/bin/conda" shell.zsh hook 2>/dev/null)"
    [ $? -eq 0 ] && eval "$__conda_setup" || path_add "${BREW_PREFIX}/Caskroom/miniconda/base/bin"
    unset __conda_setup
  fi
fi

# cassandra
path_add "/opt/dsc-cassandra/current/bin"

# chef
if [ "$CHEF_SHELL" = true ] && brew list | grep -q '^chefdk$'; then
  eval "$(chef shell-init bash)"
  export EDITOR="VIM"
fi

# curl
path_add "${BREW_PREFIX}/opt/curl/bin"

# fzf
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/' --sort=path"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }
fi

# gnu
path_add "${BREW_PREFIX}/opt/gnu-getopt/bin"

# go
if [ -d "/usr/local/opt/go/libexec" ]; then
  export GOROOT="/usr/local/opt/go/libexec"
  export GOPATH="${HOME}/Code/go"
  export GOBIN="${GOPATH}/bin"
  path_add "${GOROOT}/bin"
fi

# hadoop
if [ -d "/usr/local/Cellar/hadoop" ]; then
  export HADOOP_VERSION="$(brew list --versions hadoop | awk '{ print $2 }')"
  export HADOOP_HOME="/usr/local/Cellar/hadoop/${HADOOP_VERSION}"
  export HADOOP_CONF_DIR="${HADOOP_HOME}/libexec/etc/hadoop"
fi

# hashiCorp
# export PACKER_LOG="DEBUG"
export VAGRANT_DEFAULT_PROVIDER="virtualbox"

# java
if [ -x "/usr/libexec/java_home" ] && java -version &>/dev/null; then
  export JAVA_HOME="$("/usr/libexec/java_home")"
  export JRE_HOME="${JAVA_HOME}/jre"
  path_add "${JAVA_HOME}/bin"
fi

# node / nvm
if [ "$NVM_SHELL" = true ]; then
  if [ -d "${BREW_PREFIX}/opt/n" ]; then
    export N_PREFIX="${HOME}/.n"
    path_add ${N_PREFIX}/bin
  fi
  if [ -f "${BREW_PREFIX}/opt/nvm/nvm.sh" ]; then
    export NVM_DIR="${HOME}/.nvm"
    source "${BREW_PREFIX}/opt/nvm/nvm.sh"
  fi
fi

# openssl
[ -d "/usr/local/opt/openssl" ] && export OPENSSL_ROOT_DIR="/usr/local/opt/openssl"

# pyenv
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  path_add "$PYENV_ROOT/bin"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# ruby
[ "${RUBY_USE_BREW}" = true ] && path_add "/usr/local/opt/ruby/bin"

# xdg
export XDG_CONFIG_HOME="${HOME}/.config"

#------------------------------------------------------------------------------
# SHELL MODS
#------------------------------------------------------------------------------

# aws
SHOW_AWS_PROMPT=true
RPROMPT="${RPROMPT//\$\(aws_prompt_info\)}"

# git
if [ -f ${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh ]; then
  source "${BREW_PREFIX}/opt/git/etc/bash_completion.d/git-prompt.sh"

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUPSTREAM="verbose"
  export GIT_PS1_DESCRIBE_STYLE="branch"
  export GIT_PS1_SHOWCOLORHINTS=true

  PROMPT_COMMAND='__git_ps1 "\u@\h[\w]" "\\\$ "';
fi

# zsh
prompt_context () {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # prompt_segment "$AGNOSTER_CONTEXT_BG" "$AGNOSTER_CONTEXT_FG" "%(!.%{%F{$AGNOSTER_STATUS_ROOT_FG}%}.)%n@%m"
    prompt_segment "$AGNOSTER_CONTEXT_BG" "$AGNOSTER_CONTEXT_FG" "%(!.%{%F{$AGNOSTER_STATUS_ROOT_FG}%}.)"
  fi
}

#------------------------------------------------------------------------------
# ALIASES
#------------------------------------------------------------------------------

# utilities / system
alias flushcache="dscacheutil -flushcache"
alias flushdns="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias fixbrew='sudo chown -R "$USER":admin "$(brew --prefix)"'
alias hostfile='sudo vim /etc/hosts'
alias pubkey="cat ~/.ssh/${SSH_KEY:-id_ed25519}.pub | pbcopy"
alias utc='date -u'

# disk / filesystem
alias disk='du -hd 1'
alias fs="stat -f '%z bytes'"
alias df='df -h'

# networking
alias wmip="curl -w '\n' https://ipinfo.io/what-is-my-ip"
alias wmip='curl ipinfo.io'
alias ip="ifconfig | awk '/inet / { print \$2 }'"
alias netCons='lsof -i'
alias lsock='sudo lsof -i -P'
alias lsockU='sudo lsof -nP | grep UDP'
alias lsockT='sudo lsof -nP | grep TCP'
alias ipInfo0='ipconfig getpacket en0'
alias ipInfo1='ipconfig getpacket en1'
alias openPorts='sudo lsof -i | grep LISTEN'

# clipboard
clip() {
  [ -f "$1" ] && cat "$1" | pbcopy
}

# preferred overrides
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto --exclude-dir=.git'
alias less='less -FSRXc'
alias ls='ls -G'
alias ll='ls -Glh'

# vim
alias vim='nvim'

# shortcuts / quick commands
alias k=kubectl

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# add ~/.local/bin to PATH (gh-seed-secrets and other local tools)
export PATH="$HOME/.local/bin:$PATH"

# aws-vault: cache MFA session token for 12h (reduces MFA prompts)
export AWS_SESSION_TOKEN_TTL=12h
