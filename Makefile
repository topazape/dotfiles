DOTPATH       := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
RCPATH        := $(DOTPATH)/rc

CANDIDATES    := $(notdir $(wildcard $(RCPATH)/*))
EXCLUSIONS    := .DS_Store .git .gitmodules
LINUX_EXC     := zshenv
MAC_EXC       := 
TARGETS       := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

UNAME         := $(shell uname -s)

ZSH_DIR       := $(RCPATH)/config/zsh
ZPREZTO_DIR   := $(ZSH_DIR)/.zprezto
ZPREZTO_RCDIR := $(ZPREZTO_DIR)/runcoms

ifeq ($(UNAME), Linux)
	DOTFILES := $(filter-out $(LINUX_EXC), $(TARGETS))
else
	DOTFILES := $(filter-out $(MAC_EXC), $(TARGETS))
endif

.PHONY: all
all:

.PHONY: bashenv
bashenv:
	@rm -f $(HOME)/.bashrc
	@rm -rf $(HOME)/.bash_it
	@git clone --depth=1 https://github.com/Bash-it/bash-it.git $(HOME)/.bash_it
	@yes | $(HOME)/.bash_it/install.sh
	@. $(HOME)/.bashrc

.PHONY: zshenv
zshenv:
	@$(MAKE) prezto-init


.PHONY: prezto-init
prezto-init:
	@if [ -d $(ZPREZTO_DIR) ]; then \
		rm -rvf $(ZPREZTO_DIR); \
	 fi
	@git clone --recursive https://github.com/sorin-ionescu/prezto.git rc/config/zsh/.zprezto

	$(eval ZPREZTO_CAN  := $(notdir $(wildcard $(ZPREZTO_RCDIR)/*)))
	$(eval ZPREZTO_EXC  := zpreztorc zshrc README.md)
	$(eval ZPREZTO_TARG := $(filter-out $(ZPREZTO_EXC), $(ZPREZTO_CAN)))
	
	@$(foreach val, $(ZPREZTO_TARG), ln -snfv $(ZPREZTO_RCDIR)/$(val) $(ZSH_DIR)/.$(val);)
	@mkdir -p $(HOME)/.local/share/zsh

.PHONY: all
all:
ifeq ($(UNAME), Linux)
	@$(MAKE) bashenv
else
	@$(MAKE) zshenv
endif
	@rm -rf $(HOME)/.config $(HOME)/.local $(HOME)/.cache
	@$(foreach val, $(DOTFILES), ln -snfv $(RCPATH)/$(val) $(HOME)/.$(val);)
	@git clone --depth 1 https://github.com/wbthomason/packer.nvim $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
ifeq ($(UNAME), Linux)
	@echo '[ -d /home/linuxbrew ] && eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $(HOME)/.profile
	@echo 'source "$$HOME/.config/bash/local.bash"' >> $(HOME)/.profile
endif

.PHONY: clean
clean:
	@echo "Remove dotfiles from your home directory."
	@$(foreach val, $(DOTFILES), rm -vf $(HOME)/.$(val);)

.PHONY: purge
purge:
	@$(MAKE) clean
	@rm -rf $(HOME)/.local $(HOME)/.cache $(HOME)/.linuxbrew
