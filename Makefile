MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := default
.DELETE_ON_ERROR:
.SUFFIXES:

# include makefiles
export SELF ?= $(MAKE)
PROJECT_PATH ?= $(shell pwd)
include $(PROJECT_PATH)/Makefile.*

REPO_NAME ?= $(shell basename $(CURDIR))

BREWFILE ?= $(PROJECT_PATH)/Brewfile

#-------------------------------------------------------------------------------
# brew
#-------------------------------------------------------------------------------

# Internal guard -- deliberately no '##' comment, so it stays out of help.
brew/require:
	@command -v brew >/dev/null 2>&1 || (echo "[ERROR] Homebrew is not installed. See https://brew.sh" && exit 1)
.PHONY: brew/require

## Install everything declared in the Brewfile
brew/install: brew/require
	@echo "[INFO] Installing packages declared in '$(BREWFILE)'."
	@brew bundle install --file="$(BREWFILE)"
.PHONY: brew/install

## Report what is declared but missing, installing nothing
brew/check: brew/require
	@echo "[INFO] Checking '$(BREWFILE)' against this machine."
	@brew bundle check --file="$(BREWFILE)" --verbose || true
.PHONY: brew/check

## List installed packages NOT declared in the Brewfile
brew/drift: brew/require
	@echo "[INFO] Installed but not declared in '$(BREWFILE)':"
	@brew bundle cleanup --file="$(BREWFILE)" || true
.PHONY: brew/drift

## Regenerate the Brewfile from what is installed right now
brew/dump: brew/require
	@echo "[INFO] Regenerating '$(BREWFILE)' from the current machine."
	@brew bundle dump --file="$(BREWFILE)" --force --describe
.PHONY: brew/dump

#-------------------------------------------------------------------------------
# validate
#-------------------------------------------------------------------------------

## Parse the Brewfile without installing anything
validate: brew/require
	@echo "[INFO] Parsing '$(BREWFILE)'."
	@brew bundle list --file="$(BREWFILE)" >/dev/null
	@echo "[INFO] $$(brew bundle list --file='$(BREWFILE)' --formula | wc -l | tr -d ' ') formulae, \
$$(brew bundle list --file='$(BREWFILE)' --cask | wc -l | tr -d ' ') casks, \
$$(brew bundle list --file='$(BREWFILE)' --mas | wc -l | tr -d ' ') mas apps."
.PHONY: validate
