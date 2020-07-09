# dotfiles
my setting files.

- shell(fish or ~beef~ zsh)
- terminal(alacritty)
- tmux
- vim(neovim)
- powerline

## Usage
RECOMMEND: Makefile included. Do not copy all. Pickup you needed.

```
$ git clone https://github.com/oratake/dotfiles.git
$ cd dotfiles
$ make <PICKUP_YOU_NEEDED>
```

### Version Management Policy

anyenv

### git
Add your environment info in `$HOME/.user.gitconfig` like this.

```
[user]
  name = <GITHUB_USERNAME>
  email = <GITHUB_EMAIL>
[credential]
  helper = /usr/lib/git-core/git-credential-gnome-keyring
```

## OUTDATED
I do not use and update these for now.
- vimrc (using [neovim](https://neovim.io/) now)

# Contact
Twitter [@kyosuketakenaka](https://twitter.com/kyosuketakenaka)
