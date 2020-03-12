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
      alias rm='trash-put'
      # alias rm='mv --backup=numbered --target-directory=$HOME/.Trash'
    else
      echo 'ERROR: TrashBox(.Trash) is not exist.'
    end

  # OSX(Darwin)設定
  case '*Darwin*'
    # python pip用PATH
    set PATH $HOME"/Library/Python/3.7/bin" $PATH

    # alias rm='trash'

  case '*arch*Linux*'
    # --------------------
    # powerline
    # --------------------
    function fish_prompt
      eval powerline-go \
        -error $status \
        -cwd-max-depth 1 \
        -cwd-mode plain \
        -cwd-max-dir-size 1 \
        -modules "newline,venv,cwd,perms,git,exit,newline,root" \
        -shell bare
    end
    function fish_right_prompt
      eval powerline-go \
        # modules-right is not working.
        -modules "time" \
        -mode flat \
        -shell bare
    end
    # set fish_function_path $fish_function_path $HOME"/Library/Python/3.7/lib/python/site-packages/powerline/bindings/fish"
    # powerline-setup

    # --------------------
    # arch aliases
    # --------------------
    alias sd="shutdown"

end

# --------------------
# env
# --------------------

# 本来はlocalな.fishとかに書くもの
set -x XDG_CONFIG_HOME $HOME"/.config"
set -x XDG_CACHE_HOME $HOME"/.cache"
# 削除時 set -e 変数名

# PATH通し
# ==========
# anyenv
if [ -d $HOME"/.anyenv" ]
  set -U fish_user_paths $HOME/.anyenv/bin $fish_user_paths
  status --is-interactive; and source (anyenv init -|psub)
end

# rbenv
if [ -d $HOME"/.rbenv" ]
  set -U fish_user_paths $HOME/.rbenv/bin $fish_user_paths
  status --is-interactive; and source (rbenv init -|psub)
end

# rbenv init - | source

# go
if [ -d $HOME"/go/bin/" ]
  set PATH $HOME"/go/bin/" $PATH
end

# fisher
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# --------------------
# alias
# --------------------
alias vim='nvim'
alias vi='vim'
alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'
alias vv='vim ~/.config/nvim/'

# git
alias g='git'
alias gc='git commit'
alias gcm='git commit -m'
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

# rails
alias r='rails'
alias rt='rails test'

# docker
alias d='docker'
alias dc='docker container'
alias d-c='docker-compose'

# heroku
alias h='heroku'

# --------------------
# keyBind
# --------------------

# プロンプトでvi
fish_vi_key_bindings

# --------------------
# プロンプト
# --------------------

# fish本来のviモードの表示をなくすオーバーライド
function fish_mode_prompt
end

# bobthefish
# 左プロンプト
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes

# 右プロンプト
# command実行時間非表示
set -g theme_display_cmd_duration no
set -g theme_date_format "+%T"
