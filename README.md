<div align="center">
  <h1>osx-setup</h1>
  <p>OSX Setup Utility</p>
  <p>
    <!-- Build Status -->
    <a href="https://github.com/hansohn/osx-setup/actions/workflows/shellcheck.yml"><img src="https://img.shields.io/github/actions/workflow/status/hansohn/osx-setup/shellcheck.yml?style=for-the-badge"></a>
    <!-- Github Tag -->
    <a href="https://github.com/hansohn/osx-setup/tags/"><img src="https://img.shields.io/github/v/tag/hansohn/osx-setup?style=for-the-badge&sort=semver"></a>
    <!-- License -->
    <a href="https://github.com/hansohn/osx-setup/blob/main/LICENSE.md"><img src="https://img.shields.io/github/license/hansohn/osx-setup.svg?style=for-the-badge"></a>
  </p>
</div>

## Description

Welcome to my [osx-setup](https://github.com/hansohn/osx-setup). I am a DevOps Engineer by trade and this repo reflects the various tools I use on a daily basis. As with most osx-setup repos, this is a continuous work in progress and is updated as the systems and applications I work on evolve or my tool preferences change.

What's Included
---------------

The authoritative lists live in [`bootstrap.sh`](bootstrap.sh) — `brew_formulae`,
`brew_casks` and `mas_apps`. What follows is a summary by area, not an inventory.

### Command line

| Area | Tools |
|---|---|
| Cloud & Kubernetes | `awscli`, `aws-vault`, `doctl`, `helm`, `k9s`, `kind`, `kubernetes-cli`, `kustomize`, `argocd`, `istioctl`, `session-manager-plugin` |
| Infrastructure as code | `ansible`, `ansible-lint`, `terragrunt`, `terraform-docs`, `terraform-ls`, `tfswitch`, `tflint`, `cfn-lint` |
| Shell & editors | `zsh` + oh-my-zsh, `neovim`, `tmux`, `fzf`, `ripgrep`, `fd`, `bat`, `tree`, `lazygit`, `gh` |
| Languages | `go`, `lua`, plus `pyenv`, `nvm` and `rustup` via the scripts in [`apps/`](apps) |
| Linting | `shellcheck`, `yamllint`, `jsonlint`, `golangci-lint` |
| Misc | `curl`, `wget`, `jq`, `grep`, `gnupg`, `nmap`, `ipcalc`, `mas` |

### Applications

`1Password`, `Docker`, `Firefox`, `Google Chrome`, `Google Drive`, `iTerm2`,
`Obsidian`, `Postman`, `Raycast`, `Rectangle`, `Slack`, `Spotify`,
`Visual Studio Code`, `VirtualBox`, `Wireshark`, `Zoom`, `AppCleaner`,
`Adobe Acrobat Reader`, `Discord`, `Brooklyn`, and the Hack Nerd Font.

From the Mac App Store: `Amphetamine`, `Decompressor`, `iMazing HEIC Converter`,
`Kindle`.

### Configured, not just installed

The scripts in [`apps/`](apps) do more than install a package — they set up
`git`, `bash`, `zsh` + oh-my-zsh, `vim` + vim-plug, `iterm2`, the macOS
Terminal colorscheme, fonts, `python` (pyenv), `rust` (rustup), and
`terraform`.

macOS defaults — Dock, Finder, screenshots, timezone — are applied from
[`customizations/`](customizations).

### Color palettes

- [solarized](https://ethanschoonover.com/solarized/)

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
