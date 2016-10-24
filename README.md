# osx-setup

Welcome to my [osx-setup](https://github.com/audio4ears/osx-setup). Since I am a DevOps Engineer by trade, this osx-setup reflects the various tools I use to support a multitude of applications and operating systems on a daily basis. As with most osx-setup repos, this is a continuous work in progress and is updated as the systems/applications I work on evolve or my tool preferences change.

Whats Included
--------------

### Applications

This script will install and configure the following applications:
- [adobe flash](https://get.adobe.com/flashplayer/)
- [adobe reader](https://get.adobe.com/reader/?promoid=KLXME)
- [alfred](https://www.alfredapp.com/)
- [appcleaner](https://freemacsoft.net/appcleaner/)
- [atom](https://atom.io/)
- [awscli](https://aws.amazon.com/cli/)
- [box sync](https://sites.box.com/sync4/)
- [chefdk](https://downloads.chef.io/chef-dk/)
- [dropbox](https://www.dropbox.com/)
- [firefox](https://www.mozilla.org/en-US/firefox/products/)
- [flux](https://justgetflux.com/)
- [git](https://git-scm.com/)
- [google chrome](https://www.google.com/chrome/browser/desktop/index.html)
- [google drive](https://www.google.com/drive/)
- [homebrew](http://brew.sh/)
- [iterm2](https://www.iterm2.com/)
- [java](https://java.com/en/download/)
- [lastpass](https://lastpass.com/getlastpass.php)
- [nodejs](https://nodejs.org/en/)
- [openssl](https://www.openssl.org/)
- [packer](https://www.packer.io/)
- [python](https://www.python.org/)
- [ruby](https://www.ruby-lang.org/en/)
- [spectacle](https://www.spectacleapp.com/)
- [transmission](http://www.transmissionbt.com/)
- [vagrant](https://www.vagrantup.com/)
- [vim](http://www.vim.org/)
- [virtualbox](https://www.virtualbox.org/)
- [wget](http://www.gnu.org/software/wget/)

### Color Palettes

I use the [solarized](http://ethanschoonover.com/solarized) color theme and distinguish between viewing and editing modes by separating the light/dark color themes out between bash and vim. My editors' color themes are configured as follows:

| Editor | Color-Theme |
|--------|-------------|
| atom | default |
| iterm2 | solarized.light |
| terminal | solarized.light |
| vim | solarized.dark |

Prerequisites
-------------

```bash
# install xcode tools
$ xcode-select --install
```

Installation
------------

```bash
# clone the repo
$ git clone https://github.com/audio4ears/osx-setup.git

# execute the installer
$ osx-setup/bootstrap.sh
```
