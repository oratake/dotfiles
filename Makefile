SHELL=/bin/sh

# REQUIRE PARAMETER
.PHONY: all
all:
	@echo "`date '+[%y-%m-%d %T]'`[CAUTION!] MUST BE REQUIRED PARAMETER"
	@echo "Nothing to do."

# MAIN
.PHONY: init 
.PHONY: git fish tmux zsh nvim check
init: git tmux zsh nvim

# check:
# 	@echo `date '+[%y-%m-%d %T]'`;

git:
	ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
	ln -snfv ~/dotfiles/.gitignore_global ~/.gitignore_global
	@echo "`date '+[%y-%m-%d %T]'` git done";

# fish:
# 	ln -snfv ~/dotfiles/fish/ ~/.config/fish/
# 	@echo 'fish done'

tmux:
	ln -snfv ~/dotfiles/.tmux.conf ~/.tmux.conf
	@echo "`date '+[%y-%m-%d %T]'` tmux done";

zsh:
	ln -snfv ~/dotfiles/zsh/.zshrc ~/.zshrc
	ln -snfv ~/dotfiles/zsh/.zsh_aliases ~/.shell_aliases
	@echo "`date '+[%y-%m-%d %T]'` zsh done";

nvim:
	ln -snfv ~/dotfiles/nvim/ ~/.config/nvim/
	@echo "`date '+[%y-%m-%d %T]'` nvim done";
