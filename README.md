# osx-setup

Welcome to my [osx-setup](https://github.com/hansohn/osx-setup). I am a DevOps Engineer by trade and this repo reflects the various tools I use on a daily basis. As with most osx-setup repos, this is a continuous work in progress and is updated as the systems and applications I work on evolve or my tool preferences change.

Whats Included
--------------

### Applications

This script will install and configure the following applications:

- [adobe reader](https://get.adobe.com/reader/?promoid=KLXME)
- [aerial](https://github.com/JohnCoates/Aerial)
- [appcleaner](https://freemacsoft.net/appcleaner/)
- [atom](https://atom.io/)
- [awscli](https://aws.amazon.com/cli/)
- [caffeine](http://lightheadsw.com/caffeine/)
- [chefdk](https://downloads.chef.io/chef-dk/)
- [curl](https://curl.haxx.se/)
- [docker](https://www.docker.com/docker-mac)
- [dropbox](https://www.dropbox.com/)
- [firefox](https://www.mozilla.org/en-US/firefox/products/)
- [flux](https://justgetflux.com/)
- [git](https://git-scm.com/)
- [go](https://golang.org/)
- [google chrome](https://www.google.com/chrome/browser/desktop/index.html)
- [google drive](https://www.google.com/drive/)
- [hadoop](http://hadoop.apache.org/)
- [homebrew](http://brew.sh/)
- [iterm2](https://www.iterm2.com/)
- [java](https://java.com/en/download/)
- [jq](https://stedolan.github.io/jq/)
- [meld](http://meldmerge.org/)
- [nodejs](https://nodejs.org/en/)
- [openssl](https://www.openssl.org/)
- [packer](https://www.packer.io/)
- [postman](https://www.getpostman.com/)
- [python](https://www.python.org/)
- [ruby](https://www.ruby-lang.org/en/)
- [spectacle](https://www.spectacleapp.com/)
- [spotify](https://www.spotify.com/us/)
- [slack](https://slack.com/)
- [transmission](http://www.transmissionbt.com/)
- [vagrant](https://www.vagrantup.com/)
- [vim](http://www.vim.org/)
- [virtualbox](https://www.virtualbox.org/)
- [wget](http://www.gnu.org/software/wget/)
- [wireshark](https://www.wireshark.org/)

### Color Palettes

 - [solarized](http://ethanschoonover.com/solarized)

Prerequisites
-------------

[Command line Tools for Xcode](https://developer.apple.com/xcode/) are required by [Homebrew](https://brew.sh/) and various other applications. You can install them using the commands below or let Homebrew install them for you during its installation process.

```bash
# install xcode tools
$ xcode-select --install
```

Installation
------------

You will need Administrator level permissions to complete this setup. Enjoy!

```bash
# clone the repo
$ git clone https://github.com/hansohn/osx-setup.git

# execute the installer
$ osx-setup/bootstrap.sh
```
