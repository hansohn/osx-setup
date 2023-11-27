<div align="center">
  <h3>osx-setup</h3>
  <p>OSX Setup Utility</p>
  <p>
    <!-- Build Status -->
    <a href="https://actions-badge.atrox.dev/hansohn/osx-setup/goto?ref=main">
      <img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fhansohn%2Fosx-setup%2Fbadge%3Fref%3Dmain&style=for-the-badge">
    </a>
    <!-- Github Tag -->
    <a href="https://gitHub.com/hansohn/osx-setup/tags/">
      <img src="https://img.shields.io/github/tag/hansohn/osx-setup.svg?style=for-the-badge">
    </a>
    <!-- License -->
    <a href="https://github.com/hansohn/osx-setup/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/hansohn/osx-setup.svg?style=for-the-badge">
    </a>
    <!-- LinkedIn -->
    <a href="https://linkedin.com/in/ryanhansohn">
      <img src="https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555">
    </a>
  </p>
</div>

## Description

Welcome to my [osx-setup](https://github.com/hansohn/osx-setup). I am a DevOps Engineer by trade and this repo reflects the various tools I use on a daily basis. As with most osx-setup repos, this is a continuous work in progress and is updated as the systems and applications I work on evolve or my tool preferences change.

Whats Included
--------------

### Applications

This script will install and configure the following applications:

- [adobe reader](https://get.adobe.com/reader/?promoid=KLXME)
- [aerial](https://github.com/JohnCoates/Aerial)
- [anaconda](https://www.anaconda.com/)
- [apache-directory-studio](https://directory.apache.org/studio/)
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
- [intellij-idea-ce](https://www.jetbrains.com/idea/)
- [iterm2](https://www.iterm2.com/)
- [java](https://java.com/en/download/)
- [jq](https://stedolan.github.io/jq/)
- [meld](http://meldmerge.org/)
- [nodejs](https://nodejs.org/en/)
- [openssl](https://www.openssl.org/)
- [packer](https://www.packer.io/)
- [postman](https://www.getpostman.com/)
- [pycharm-ce](https://www.jetbrains.com/pycharm/)
- [python](https://www.python.org/)
- [ruby](https://www.ruby-lang.org/en/)
- [sbt](https://www.scala-sbt.org/)
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
