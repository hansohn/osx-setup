# osx-setup
Welcome to my [osx-setup](https://github.com/audio4ears/osx-setup). Since I am a Systems Administrator by trade, this osx-setup reflects the various tools I use to support a multitude of applications and operating systems on a daily basis. As with most osx-setup repos, this is a continuous work in progress and is updated as the systems/applications I work on evolve or my tool preferences change.

I started my career as a Windows admin and eventually made the leap to OSX and Linux. Unfortunately, try as I might to move forward, the Windows abyss has a tendency to suck me back in. This is reflected in my setup with the addition of Powershell and Batch/Command syntax highlighting in my Atom and Vim Editors. At this point in the game I feel that if you are going to call yourself a system administrator you need to be able to administer all systems... Windows included. Or at least thats how I keep myself from crying myself to sleep at night.

Whats Included
--------------
### Applications
This script will install and configure the following applications:
- [atom](https://atom.io/)
- [chefdk](https://downloads.chef.io/chef-dk/)
- [git](https://git-scm.com/)
- [homebrew](http://brew.sh/)
- [iterm2](https://www.iterm2.com/)
- [openssl](https://www.openssl.org/)
- [packer](https://www.packer.io/)
- [ruby](https://www.ruby-lang.org/en/)
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
