SHELL := /bin/bash

apps := $(CURDIR)/apps

apps: git zsh tmux vim fasd urlview ranger

.PHONY: apps git zsh tmux vim fasd ranger

git:

	@echo "git..."
	@ln -fs "$(apps)/git/gitconfig" ~/.gitconfig

zsh:

	@echo "zsh..."
	@ln -fs "$(apps)/zsh/zshrc"     ~/.zshrc\

tmux:

	@echo "tmux..."
	@ln -fs "$(apps)/tmux/tmux.conf" ~/.tmux.conf
	@if test ! -d ~/.tmux/plugins/tpm; then\
		export TMUX_PLUGIN_MANAGER_PATH '$HOME/.tmux/plugins/';\
		mkdir -p ~/.tmux/plugins;\
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;\
		~/.tmux/plugins/tpm/bin/install_plugins;\
	fi;

vim:

	@echo "vim..."

	@if test ! -d ~/.config/nvim; then\
		mkdir -p ~/.config;\
		ln -fs "$(apps)/vim" ~/.config/nvim;\
	fi;

ranger:

	@echo "ranger..."

	@if test ! -d ~/.config/ranger; then\
		mkdir -p ~/.config/ranger;\
		ln -fs "$(apps)/ranger/rc.conf" ~/.config/ranger/rc.conf;\
	fi;

fasd:

	@echo "fasd..."
	@ln -fs $(apps)/fasd/fasdrc ~/.fasdrc

urlview:

	@echo "urlview...."
	@ln -fs $(apps)/urlview/urlview ~/.urlview
