DOTPATH       := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
RCPATH        := $(DOTPATH)/rc

CANDIDATES    := $(notdir $(wildcard $(RCPATH)/*))
EXCLUSIONS    := .DS_Store .git .gitmodules
TARGETS       := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

ZSHENV        := zshenv
UNAME         := $(shell uname -s)

ZSH_DIR       := $(RCPATH)/config/zsh
ZPREZTO_DIR   := $(ZSH_DIR)/.zprezto
ZPREZTO_RCDIR := $(ZPREZTO_DIR)/runcoms
ZPREZTO_CAN   := $(notdir $(wildcard $(ZPREZTO_RCDIR)/*))
ZPREZTO_EXC   := zpreztorc zshrc README.md
ZPREZTO_TARG  := $(filter-out $(ZPREZTO_EXC), $(ZPREZTO_CAN))

ifeq ($(UNAME), Linux)
	DOTFILES := $(TARGETS)
else
	DOTFILES := $(ZSHENV)
endif

.PHONY: all
all:

.PHONY: init
init:
	@if [ -d $(ZPREZTO_DIR) ]; then \
		rm -rf $(ZPREZTO_DIR); \
	 fi
	@git clone --recursive https://github.com/sorin-ionescu/prezto.git \
		rc/config/zsh/.zprezto
	@$(foreach val, $(ZPREZTO_TARG), ln -snfv $(ZSH_DIR)/$(val) $(ZSH_DIR)/.$(val);)

.PHONY: help
help:
	@echo "init   => Initialize environment settings."
	@echo "deploy => Create symlinks to home directory."
	@echo "clean  => remove the dotfiles."

.PHONY: deploy 
deploy:
	@$(foreach val, $(DOTFILES), ln -snfv $(RCPATH)/$(val) $(HOME)/.$(val);)

.PHONY: clean
clean:
	@echo "Remove dotfiles from your home directory."
	@$(foreach val, $(DOTFILES), rm -vf $(HOME)/.$(val);)
