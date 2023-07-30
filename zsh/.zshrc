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
# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# }}}

# IMPORT {{{
# shell aliases
if [ -f "${HOME}/.shell_aliases" ]; then
  source "${HOME}/.shell_aliases"
fi

# local import
if [ -f "${HOME}/.zsh_local" ]; then
  source "${HOME}/.zsh_local"
fi
# }}}

# AUTOCOMP {{{
autoload -U compinit
compinit

setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
setopt share_history
setopt no_beep
#ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt AUTO_PARAM_SLASH
#ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt MARK_DIRS
#明確なドットの指定なしで.から始まるファイルをマッチ
setopt GLOBDOTS
#aliasを展開して補完
unsetopt COMPLETE_ALIASES
#rm *で確認
setopt RM_STAR_WAIT
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' menu select=2 # 補完候補をハイライト

autoload predict-on # 予測変換 on
autoload history-search-end # 文中から補完をする
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# }}}

# OPTION {{{
bindkey -v

zstyle ':completion:*' insert-tab false # TABが入力されないように
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin # sudoつけても補完
# }}}

# PROMPT {{{
autoload -Uz colors && colors

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

# asdf {{{
if [ -e "/opt/asdf-vm/asdf.sh" ]; then
  # for pacman path
  . /opt/asdf-vm/asdf.sh
else
  echo '[NOTICE] Runtime Version Manager "asdf" is not installed.'
fi
# }}}

# rust {{{
if command -v cargo >/dev/null 2>&1; then
  export PATH=$HOME/.cargo/bin:$PATH
else
  echo '[NOTICE] Cargo(Rust) is not installed.'
fi
# }}}
