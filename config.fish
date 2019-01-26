alias vi='/usr/bin/vim'
alias open='explorer.exe'

alias vf='vim ~/.config/fish/config.fish'
alias sf='source ~/.config/fish/config.fish'
alias vv='vim ~/.config/nvim/init.vim'

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
