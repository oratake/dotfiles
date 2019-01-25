# --------------------
# INIT
# --------------------

# zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug.git ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "b4b4r07/enhancd", use:init.sh


export ENHANCD_COMMAND=ed

autoload -U compinit
compinit

# --------------------
# ALIASES
# --------------------

alias l='ls -ltr --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'

# これいる？
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'

# --------------------
# PROMPT
# --------------------

# powerline
zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme"
POWERLEVEL9K_PROMOT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# PROMPT="
# %(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~
# %# "
# 
# RPROMPT="[%W %*]"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load

