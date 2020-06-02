# TMUX {{{

# tmuxセッションが存在しているときは、アタッチ
# https://qiita.com/ssh0/items/a9956a74bff8254a606a
if [[ ! -n $TMUX ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  ID="`echo $ID | $FZF | cut -d: -f1`"
  tmux attach-session -t "$ID"
fi

# }}}

# INIT {{{

# # zplug
# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/zplug/zplug.git ~/.zplug
# fi
# 
# source ~/.zplug/init.zsh
# 
# zplug "b4b4r07/enhancd", use:init.sh

# export ENHANCD_COMMAND=ed

# }}}

# ALIASES {{{

if [ -f "${HOME}/.shell_aliases" ]; then
  source "${HOME}/.shell_aliases"
fi

# }}}

# AUTOCOMP {{{

autoload -U compinit
compinit

setopt auto_list auto_menu list_packed list_types share_history
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' menu select=2 # 補完候補をハイライト

# }}}

# PROMPT {{{

# # powerline
# zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme"
# POWERLEVEL9K_PROMOT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

autoload -Uz colors && colors

PROMPT="
%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~
%# "
# 
# RPROMPT="[%W %*]"

# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# 
# zplug load
# 
# 
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship
# https://starship.rs/ja-jp/
if [[ $(command -v starship) ]]; then
  eval "$(starship init zsh)"
else
  echo '[NOTICE] Starship is not installed.'
fi
# }}}

# ANYENV {{{

export PATH=$HOME/.anyenv/bin:$PATH

if type -a anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# }}}
