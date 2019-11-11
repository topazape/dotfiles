DOTPATH       := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
RCPATH        := $(DOTPATH)/rc

CANDIDATES    := $(notdir $(wildcard $(RCPATH)/*))
EXCLUSIONS    := .DS_Store .git .gitmodules
MAC_EXC       := gitconfig sqliterc tmux.conf
TARGETS       := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

UNAME         := $(shell uname -s)

ZSH_DIR       := $(RCPATH)/config/zsh
ZPREZTO_DIR   := $(ZSH_DIR)/.zprezto
ZPREZTO_RCDIR := $(ZPREZTO_DIR)/runcoms

ifeq ($(UNAME), Linux)
	DOTFILES := $(TARGETS)
else
	DOTFILES := $(filter-out $(MAC_EXC), $(TARGETS))
endif

.PHONY: all
all:

.PHONY: help
help:
	@echo "init   => Initialize environment settings."
	@echo "deploy => Create symlinks to home directory."
	@echo "clean  => remove the dotfiles."
	@echo "update => update prezto"

.PHONY: prezto-init
prezto-init:
	@if [ -d $(ZPREZTO_DIR) ]; then \
		rm -rvf $(ZPREZTO_DIR); \
	 fi
	@git clone --recursive https://github.com/sorin-ionescu/prezto.git \
		rc/config/zsh/.zprezto

	$(eval ZPREZTO_CAN  := $(notdir $(wildcard $(ZPREZTO_RCDIR)/*)))
	$(eval ZPREZTO_EXC  := zpreztorc zshrc README.md)
	$(eval ZPREZTO_TARG := $(filter-out $(ZPREZTO_EXC), $(ZPREZTO_CAN)))
	
	@$(foreach val, $(ZPREZTO_TARG), ln -snfv $(ZPREZTO_RCDIR)/$(val) $(ZSH_DIR)/.$(val);)
	@mkdir -p $(HOME)/.local/share/zsh

.PHONY: vim-plug-init
vim-plug-init:
	@curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: init
init:
ifeq ($(UNAME), Linux)
	@$(MAKE) prezto-init
	@$(MAKE) vim-plug-init
else
	@$(MAKE) prezto-init
endif

.PHONY: deploy
deploy:
	@$(foreach val, $(DOTFILES), ln -snfv $(RCPATH)/$(val) $(HOME)/.$(val);)

.PHONY: update
update:
	@cd $(ZPREZTO_DIR) && git pull && git submodule update --init --recursive

.PHONY: clean
clean:
	@echo "Remove dotfiles from your home directory."
	@$(foreach val, $(DOTFILES), rm -vf $(HOME)/.$(val);)

.PHONY: all-clean
all-clean:
	@$(MAKE) clean
	@$(foreach val, $(ZPREZTO_TARG), rm -vf $(ZSH_DIR)/.$(val);)
	@rm -rvf $(HOME)/.local
