DOTPATH        := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
RCPATH         := $(DOTPATH)/rc

PROFILE        := $(notdir $(RCPATH)/profile)
BASH_INIT      := $(notdir $(wildcard $(RCPATH)/bash/*))
ZSH_INIT       := $(notdir $(wildcard $(RCPATH)/zsh/*))
CONFIG_DIR     := $(notdir $(RCPATH)/config)


.PHONY: all
all: ;

.PHONY: clean
clean:
	rm -f $(HOME)/.$(PROFILE)
	$(foreach val, $(BASH_INIT), rm -f $(HOME)/.$(val);)
	$(foreach val, $(ZSH_INIT), rm -f $(HOME)/.$(val);)
	rm -f $(HOME)/.$(CONFIG_DIR)

.PHONY: purge
purge:
	$(MAKE) clean
	rm -rf $(HOME)/.local $(HOME)/.cache

.PHONY: base-install
base-install:
	# set ~/.profile
	ln -snfv $(RCPATH)/$(PROFILE) $(HOME)/.$(PROFILE)
	# set config dir
	ln -snfv $(RCPATH)/$(CONFIG_DIR) $(HOME)/.$(CONFIG_DIR)
	# install neovim plugin manager
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim

.PHONY: bashenv
bashenv:
	$(MAKE) base-install
	# change login shell
	$(shell chsh -s bash)
	# set bash init files
	$(foreach val, $(BASH_INIT), ln -snfv $(RCPATH)/bash/$(val) $(HOME)/.$(val);)
	# clean files from bash-it
	rm -f $(HOME)/.bashrc
	rm -rf $(HOME)/.bash_it
	# install bash-it
	git clone --depth=1 https://github.com/Bash-it/bash-it.git $(HOME)/.bash_it
	$(HOME)/.bash_it/install.sh --silent
	# custom bash-it
	sed -i -e '1i export BASH_IT_CUSTOM=$${XDG_CONFIG_HOME}/bash' $(HOME)/.bashrc
	sed -i -e 's/BASH_IT_THEME=.*/BASH_IT_THEME=$${XDG_CONFIG_HOME}\/bashit\/barbuk_mod.theme.bash/' $(HOME)/.bashrc

.PHONY: zshenv
zshenv:
	$(MAKE) purge
	$(MAKE) base-install
	# change login shell
	$(shell chsh -s $(shell which zsh))
	# set zsh init files
	$(foreach val, $(ZSH_INIT), ln -snfv $(RCPATH)/zsh/$(val) $(HOME)/.$(val);)
	# install zim
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | ZIM_HOME=$(HOME)/.local/share/zim zsh
