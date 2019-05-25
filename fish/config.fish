# greeting message
function fish_greeting
  echo '><))"> Hello. pkpkpk... ＜◎（●´▿`●）◎＞yan...'
end
set fish_greeting

# --------------------
# OS依存設定
# --------------------

# echo "Your env is "(uname)"."

switch (uname -a)
  ## Windows10 WSL Ubuntu 設定
  case '*Linux*Microsoft*'
    # WSL GUI環境設定
    # https://qiita.com/MERIK/items/ef4ecf7a51f89c403e94
    set -x DISPLAY localhost:0.0
    set -x LIBGL_ALWAYS_INDIRECT 1

    # Vagrant関係
    set -x VAGRANT_WSL_ENABLE_WINDOWS_ACCESS "1"
    set -x VAGRANT_WSL_WINDOWS_ACCESS_USER "User"
    
    set PATH "/mnt/c/Program Files/Oracle/VirtualBox" $PATH

    #alias
    alias open='explorer.exe'
    alias o='explorer.exe .'

    # ゴミ箱($HOME/.Trash)
    # https://github.com/rcmdnk/trash
    # if [ -d /usr/local/bin/trash ]
    # else
    #   echo '[CAUTION] You do not have "trash.sh"
    #  Install this sh: https://github.com/rcmdnk/trash'
    # end

    if [ -d $HOME/.Trash ]
      alias rm='mv --backup=numbered --target-directory=$HOME/.Trash'
    else
      echo 'ERROR: TrashBox(.Trash) is not exist.'
    end

    # rbenv
    status --is-interactive; and source (rbenv init -|psub)

  # OSX(Darwin)設定
  case '*Darwin*'
    alias rm='trash'
end

# --------------------
# env
# --------------------

# 本来はlocalな.fishとかに書くもの
set -x XDG_CONFIG_HOME $HOME"/.config"
set -x XDG_CACHE_HOME $HOME"/.cache"
# 削除時 set -e 変数名

# PATH通し
# rbenv
set -U fish_user_paths $HOME/.rbenv/bin $fish_user_paths
# rbenv init - | source

# --------------------
# alias
# --------------------

alias vim='nvim'
alias vi='/usr/local/bin/nvim'
alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'
alias vv='vim ~/.config/nvim/'

# git
alias g='git'
alias gc='git commit -m'
alias gco='git checkout'
alias ga='git add'
alias gau='git add -u'
alias gaA='git add -A'
alias gs='git status'
alias gd='git diff --color-words'
alias gl='git log --graph --decorate --oneline --color --all --pretty="format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]" --date=format:"%y-%m-%d %T"'
alias gpus='git push'
alias gpul='git pull'
alias gm='git merge'

# docker
alias d='docker'
alias dc='docker container'

# --------------------
# keyBind
# --------------------

# プロンプトでvi
fish_vi_key_bindings

# プロンプト設定
# bobthefish
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
