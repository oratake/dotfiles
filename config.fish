alias vi='/usr/bin/vim'
alias open='explorer.exe'

alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'

# ゴミ箱
if [ -d $HOME/.Trash ]
  alias rm='mv --backup=numbered --target-directory=$HOME/.Trash'
end

# プロンプト設定
# function fish_prompt
#  ~/powerline-shell.py $status --shell bare ^/dev/null
# end

# set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish"
# powerline-setup

function fish_greeting
  echo '><))"> Gyo gyo.'
end

function fish_prompt
  printf '\n%s%s%s\n><))"> ' (set_color #fish_color_cwd) (prompt_pwd) (set_color normal)
end

function fish_right_prompt
  date '+[%T %Y/%m/%d]'
end
