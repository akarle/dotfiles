# Makefile -- to compile and install dotfiles
ALL = .cwmrc .exrc .gitconfig .mbsyncrc .shrc .tmux.conf .xsession \
      .mailcap .muttrc .config/nvim .csirc .ed_inputrc .inputrc \
      .Xresources

# CURDIR is gmake, .CURDIR is bmake. One will exist!
DOTS = $(CURDIR)$(.CURDIR)

.PHONY: help
help:
	@echo run \"make install\" to symlink dotfiles to $(HOME)

.PHONY: install
install: build
	@mkdir -p $$HOME/.config
	@for f in $(ALL); do \
		if [ -e "$$HOME/$$f" ]; then \
			echo "Up to date: $$f" 1>&2; \
		else \
			echo "Installed:  $$HOME/$$f -> $(DOTS)/$$f"; \
			ln -s "$(DOTS)/$$f" "$$HOME/$$f"; \
		fi \
	done
