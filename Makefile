DOTPATH        := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
RCPATH         := $(DOTPATH)/rc

CANDIDATES     := $(notdir $(wildcard $(RCPATH)/*))
EXCLUSIONS     := .DS_Store .git .gitmodules
LINUX_EXC      :=
MAC_EXC        :=

TARGETS        := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
IN_CONFIG      := $(dir wildcard $(RCPATH/config/*))

UNAME          := $(shell uname -s)

ifeq ($(UNAME), Darwin)
	DOTFILES := $(filter-out $(MAC_EXC), $(TARGETS))
else
	DOTFILES := $(filter-out $(LINUX_EXC), $(TARGETS))
endif

# This rule is necessary
.PHONY: all
all:
	rm -rf $(HOME)/.config $(HOME)/.local $(HOME)/.cache
	$(foreach val, $(DOTFILES), ln -snfv $(RCPATH)/$(val) $(HOME)/.$(val);)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
ifreq ($(UNAME), Linux)
	$(MAKE) bashenv

.PHONY: clean
clean:
	$(foreach val, $(DOTFILES), unlink $(HOME)/.$(val);)

.PHONY: purge
purge:
	$(MAKE) clean
	rm -rf $(HOME)/.local $(HOME)/.cache

.PHONY: bashenv
bashenv:
	rm -f $(HOME)/.bashrc
	rm -rf $(HOME)/.bash_it
	git clone --depth=1 https://github.com/Bash-it/bash-it.git $(HOME)/.bash_it
	yes | $(HOME)/.bash_it/install.sh
	sed -i -e '1i export BASH_IT_CUSTOM=$${XDG_CONFIG_HOME}/bash' $(HOME)/.bashrc
	sed -i -e 's/BASH_IT_THEME=.*/BASH_IT_THEME=$${XDG_CONFIG_HOME}\/bash\/themes\/barbuk_mod.theme.bash/' $(HOME)/.bashrc
