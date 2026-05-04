SHELL=/bin/sh

# REQUIRE PARAMETER
.PHONY: all
all:
	@echo "`date '+[%y-%m-%d %T]'`[CAUTION!] MUST BE REQUIRED PARAMETER"
	@echo "Nothing to do."

# MAIN
.PHONY: init
.PHONY: minimal
init: minimal

minimal:
	mkdir -p ~/.claude/
	ln -snfv ~/dotfiles/claude/settings.json ~/.claude/settings.json
	@echo "`date '+[%y-%m-%d %T]'` minimal done";
