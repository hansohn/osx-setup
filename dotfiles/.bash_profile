#!/usr/bin/env bash

# ----- Modify PATH -----
PATH="/usr/local/bin:${PATH}"                                     # Prefer user defined binaries
! which chef >> /dev/null 2>&1 || eval "$(chef shell-init bash)"  # Add chefdk binaries to PATH

# ----- Export -----
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# ----- Set Editor -----
#set -o vi

# ----- Apache -----
alias apacheRestart='sudo apachectl restart'                      # Restart apache
alias apacheEdit='sudo vim /etc/httpd/httpd.conf'                 # Edit apache conf
alias vhost='sudo vim /etc/apache2/extra/httpd-vhosts.conf'       # Edit apache vhosts listings
alias herr='tail /var/log/httpd/error_log'                        # Tail apache error logs
alias apacheLogs="less +F /var/log/apache2/error_log"             # Show apache error logs

# ----- CACHE -----
alias flushcache="dscacheutil -flushcache"                        # Flush cache

# ----- Disk -----
alias disk='du -hd 1'                                             # Disk usage
alias fs="stat -f '%z bytes'"                                     # File size

# ----- DNS -----
alias flushdns="sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches" # Flush DNS cache
alias hostfile='sudo vim /etc/hosts'                              # Edit Hostfile

# ----- Firewall -----
alias showBlocked='sudo ipfw list'                                # All ipfw rules inc/ blocked IPs

# ----- Networking -----
alias wmip="dig +short myip.opendns.com @resolver1.opendns.com"   # Get external IP (whats my ip)
alias ip="ifconfig | awk '/inet / { print \$2 }'"                 # Get all local IPs
alias netCons='lsof -i'                                           # Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P'                           # Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'                 # Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'                 # Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'                            # Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'                            # Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'                      # All listening connections

# ----- Preferred Commands -----
alias cp='cp -iv'                                                 # Preferred 'cp'
alias df="df -h"                                                  # Preferred ‘df’
alias grep='grep --color=auto --exclude-dir=\.git'                # Preferred ‘grep’
alias less='less -FSRXc'                                          # Preferred 'less'
alias ll='ls -Glh'                                                # Preferred ‘ll’
alias ls='ls -G'                                                  # Preferred ‘ls’
alias mv='mv -iv'                                                 # Preferred ‘mv’
alias mkdir='mkdir -pv'                                           # Preferred ‘mkdir’

# ----- SSH -----
alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"                         # Copy my public key to the pasteboard

# ----- TIME -----
alias utc='date -u'                                               # Print UTC time

# ----- TRASH -----
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl" # Empty the Trash on all mounted volumes and the main HDD
