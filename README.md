<div align="center">
  <h1>mac-setup</h1>
  <p>Opinionated macOS setup for infrastructure and platform engineering</p>
  <p>
    <!-- Build Status -->
    <a href="https://github.com/hansohn/mac-setup/actions/workflows/shellcheck.yml"><img src="https://img.shields.io/github/actions/workflow/status/hansohn/mac-setup/shellcheck.yml?style=for-the-badge"></a>
    <!-- Github Tag -->
    <a href="https://github.com/hansohn/mac-setup/tags/"><img src="https://img.shields.io/github/v/tag/hansohn/mac-setup?style=for-the-badge&sort=semver"></a>
    <!-- License -->
    <a href="https://github.com/hansohn/mac-setup/blob/main/LICENSE.md"><img src="https://img.shields.io/github/license/hansohn/mac-setup.svg?style=for-the-badge"></a>
  </p>
</div>

## Description

This repo sets up a macOS machine for infrastructure and platform work — the Terraform, Ansible, Kubernetes and AWS toolchains, plus the shell, editor and terminal configuration I use daily. Like most setup repos it is a continuous work in progress, updated as the systems I work on evolve and my tool preferences change.

What's Included
---------------

Everything installable is declared in [`Brewfile`](Brewfile) — formulae, casks, Mac App Store apps and taps — and installed by `bootstrap.sh` with a single `brew bundle install`. What follows is a summary by area, not an inventory.

### Command line

| Area | Tools |
|---|---|
| Cloud & Kubernetes | `awscli`, `aws-vault`, `doctl`, `gcloud-cli`, `helm`, `k9s`, `kind`, `kubernetes-cli`, `kubectx`, `kustomize`, `argocd`, `istioctl`, `eksctl`, `cfn-lint`, `session-manager-plugin` |
| Infrastructure as code | `terraform`, `terragrunt`, `terraform-docs`, `terraform-ls`, `tflint`, `tfsec`, `packer`, `vagrant`, `ansible`, `ansible-lint` |
| Shell & editors | `zsh` with oh-my-zsh, `bash`, `neovim`, `macvim`, `tmux`, `git`, `lazygit`, `gh`, `tree-sitter` |
| Search & files | `fzf`, `ripgrep`, `fd`, `bat`, `tree`, `grep`, `jq`, `curl`, `wget`, `1password-cli` |
| Languages | `go`, `lua`, `maven`, `pyenv`, `nvm`, `uv`; Rust via `rustup`, installed by [`apps/rust.sh`](apps/rust.sh) |
| Linting | `shellcheck`, `yamllint`, `jsonlint`, `golangci-lint`, `selene` |

### AI

`opencode`, `ollama` and `claude` (Claude Code) on the command line, plus the ChatGPT desktop app.

### Applications

1Password, Adobe Acrobat Reader, AppCleaner, Discord, Docker Desktop, Firefox, Ghostty, Google Chrome, Google Drive, iTerm2, Microsoft Teams, Obsidian, Postman, Raycast, Rectangle, Signal, Slack, Spotify, VirtualBox, Visual Studio Code, Wireshark and Zoom, plus the Hack Nerd Font and the Zulu 21 JDK.

From the Mac App Store: Amphetamine, Decompressor, iMazing HEIC Converter and Kindle.

### Configured, not installed

The scripts in [`apps/`](apps) install nothing. They run after `brew bundle` and only configure: `git` identity and defaults, `bash`, `zsh` with oh-my-zsh, `vim` with vim-plug and its plugins, Rust via `rustup`, iTerm2 shell integration and colour schemes, the macOS Terminal colorscheme, and vagrant plugins.

`apps/homebrew.sh` is the exception — it installs Homebrew itself, which is the one thing that cannot come from a Brewfile.

macOS defaults — Dock, Finder, screenshots, firewall, timezone — are applied from [`customizations/`](customizations).

### Keeping it honest

```sh
make brew/check     # declared but missing or outdated
make brew/drift     # installed but NOT declared
make brew/dump      # regenerate the Brewfile from this machine
```

`make brew/drift` is the one worth running periodically. It answers "what did I install months ago and never write down" — which is how the previous hand-maintained list fell years out of date.

### Color palettes

- [solarized](https://ethanschoonover.com/solarized/)
- [tokyonight](https://github.com/folke/tokyonight.nvim)

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
$ git clone https://github.com/hansohn/mac-setup.git

# execute the installer
$ mac-setup/bootstrap.sh
```
