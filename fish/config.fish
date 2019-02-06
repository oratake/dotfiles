# --------------------
# OS依存設定
# --------------------

echo "Your env is "(uname)"."

# ゴミ箱($HOME/.Trash)
# https://github.com/rcmdnk/trash
if [ -d /usr/local/bin/trash ]
else
  echo '[CAUTION] You do not have "trash.sh"
Install this sh: https://github.com/rcmdnk/trash'
end

switch (uname -a)
  ## Windows10 WSL Ubuntu()設定
  case '*Linux*Microsoft*'
    alias open='explorer.exe'
    alias o='explorer.exe .'

    ## ゴミ箱
    if [ -d $HOME/.Trash ]
      alias rm='mv --backup=numbered --target-directory=$HOME/.Trash'
    else
      echo 'ERROR: TrashBox(.Trash) is not exist.'
    end

  ## OSX(Darwin)設定
  case '*Darwin*'
    alias rm='trash'
end

# 環境変数
# 本来はlocalな.fishとかに書くもの
set -x XDG_CONFIG_HOME $HOME"/.config"
set -x XDG_CACHE_HOME $HOME"/.cache"
# 削除時 set -e 変数名

# --------------------
# alias
# --------------------

alias vim='nvim'
alias vi='/usr/local/bin/nvim'
alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'
alias vv='vim ~/.config/nvim/'

# --------------------
# keyBind
# --------------------



# プロンプト設定
# function fish_prompt
#  ~/powerline-shell.py $status --shell bare ^/dev/null
# end

# set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
# powerline-setup
