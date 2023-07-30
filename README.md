# dotfiles
my setting files.

- shell(zsh)
- tmux
- neovim([astronvim](https://astronvim.com/))
- i3(window manager)

## Usage
RECOMMEND: Makefile included. Do not copy all. Pickup you needed.

```
$ git clone https://github.com/oratake/dotfiles.git
$ cd dotfiles
$ make <PICKUP_YOU_NEEDED>
```

### Version Management Policy

~~anyenv~~
asdf

### Freqent Use

AUR(ArchLinux User Repository) manager: paru

### zsh
package manager: sheldon

### git
Add your environment info in `$HOME/.user.gitconfig` like this.  
If you config

```gitconfig
[user]
  name = <GITHUB_USERNAME>
  email = <GITHUB_EMAIL>
[credential "https://github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/2.23.0/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/2.23.0/bin/gh auth git-credential
```

## OUTDATED
I do not use and update these for now.
- vimrc (using [neovim](https://neovim.io/) now)

# Contact
Twitter [@kyosuketakenaka](https://twitter.com/kyosuketakenaka)

# Disclaimer(免責)
このリポジトリの内容を使用して生じた如何なる不具合や損害について一切の責任を負いません。あくまで参考としてご利用ください。
I do not accept any responsibility for events or damages arising from the use of this repository.
