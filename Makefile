SHELL=/bin/sh

# REQUIRE PARAMETER
.PHONY: all
all:
	@echo "`date '+[%y-%m-%d %T]'`[CAUTION!] MUST BE REQUIRED PARAMETER"
	@echo "Nothing to do."

# MAIN
.PHONY: init
.PHONY: git fish tmux zsh nvim ideavim alacritty archlinux i3 awesome check
init: git tmux zsh nvim

# check:
# 	@echo `date '+[%y-%m-%d %T]'`;

git:
	ln -snfv ~/dotfiles/git/.gitconfig ~/.gitconfig
	ln -snfv ~/dotfiles/.gitignore_global ~/.gitignore_global
	cp -n ~/dotfiles/git/.user.gitconfig ~/.user.gitconfig
	@echo "`date '+[%y-%m-%d %T]'` git done\n[IMPORTANT] You need to add the user infomation into ~/.user.gitconfig\nCheck https://github.com/oratake/dotfiles/blob/master/README.md";

fish:
	mkdir -p ~/.config/fish
	ln -snfv ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
	@echo "`date '+[%y-%m-%d %T]'` fish done \nNOTE: Only config.fish";

tmux:
	ln -snfv ~/dotfiles/.tmux.conf ~/.tmux.conf
	@echo "`date '+[%y-%m-%d %T]'` tmux done";

zsh:
	ln -snfv ~/dotfiles/zsh/.zshrc ~/.zshrc
	ln -snfv ~/dotfiles/.shell_aliases ~/.shell_aliases
	@echo "`date '+[%y-%m-%d %T]'` zsh done";

nvim:
	mkdir -p ~/.config
	ln -snfv ~/dotfiles/vim/.config/nvim ~/.config/
	@echo "`date '+[%y-%m-%d %T]'` nvim done";

ideavim:
	ln -snfv ~/dotfiles/.ideavimrc ~/.ideavimrc
	@echo "`date '+[%y-%m-%d %T]'` ideavimrc done";

alacritty:
	mkdir -p ~/.config/alacritty/
	ln -snfv ~/dotfiles/alacritty.yml ~/.config/alacritty/
	@echo "`date '+[%y-%m-%d %T]'` alacritty done";

archlinux:
	ln -snfv ~/dotfiles/archlinux/.zsh_local ~/.zsh_local
	@echo "`date '+[%y-%m-%d %T]'` archlinux done";

i3:
	ln -snfv ~/dotfiles/i3/config ~/.config/i3/config
	@echo "`date '+[%y-%m-%d %T]'` i3 done";

awesome:
	mkdir -p ~/.config/awesome
	ln -snfv ~/dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
	@echo "`date '+[%y-%m-%d %T]'` awesome done";
