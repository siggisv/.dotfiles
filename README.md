# My dotfiles (aka config files)

Those are some of my personal config files. Most of those (and the following
instructions) assume the OS to be Linux.

## Requirements

- The config for vim assumes that the terminal support at least 256 colours
  and has a dark background. One that is dark enough so that the color `236`
  (i.e. rgb: `#303030`), that is used to mark whitespace characters, is still
  visible.
- The config for neovim assumes:
  - a terminal with 24-bit "truecolour" and cursor-shaping support.
  - that `clangd` has been installed.

- `bash_prompt.sh` assumes you have downloaded `.git-prompt.sh` from the
  [github repository,
  git/git](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
  and saved it to your `$HOME` directory.

## Notes

`bash_prompt.sh` adds info to your command promt showing which python venv is
active (if there is one) and info about the status of your current git
repository (if you're inside one).

The git status info starts with the `⎇`-symbol and the current branch name,
followed by:

- `*` if there are any unstaged changed
- `+` if there are any staged changed
- `$` if something has been stashed
- `%` if there are untracked files

If there is an upstream version of the current branch, the git status info
will end with `|u` followed by:

- `+` if the branch is ahead of upstream, followed with number of commits
  ahead
- `-` if the branch is behind upstream, followed with number of commits behind
- both, if you have diverged
- `=` if there is no difference

## Installation

First install git if you haven't already done so. Then clone this repository:

```bash
git clone https://github.com/siggisv/.dotfiles ~/.dotfiles
cd ~/.dotfiles
git submodule update --init

# Or simpler one liner:
git clone --recurse-submodules https://github.com/siggisv/.dotfiles ~/.dotfiles
```

### git (on Windows and Linux)

If needed remove/archive the old file, `~/.gitconfig`. Then copy the following
file:

```bash
cp ~/.dotfiles/git/.gitconfig ~/.gitconfig
```

Edit it to replace the parts surrounded by "{" and "}" with the correct info:

```gitconfig
[user]
    signingkey = {Your PGP signing key}
    email = {your@email.com}
    name = {Your Name}
[commit]
	gpgsign = {true/false}
```

**Note:** IF you want to sign your commits, then `{Your PGP-signing key}`
should be your public PGP-key and `gpgsign` should be `true`.
See [Managing commit signature
verification](https://docs.github.com/en/authenticating/managing-commit-signature-verification)
for how to create one and add it to your GitHub account. See e.g.
[Moving/Copying your PGP 
Keys](https://www.phildev.net/pgp/gpg_moving_keys.html)
for how to copy the private keys between computers (Note on Windows. The
setup of the PGP-key needs to be done from within `Git Bash`).

If you do set a PGP-key to be used to sign your commits, you also need to add
the following line to the end of your `~/.bashrc` file (not needed on Windows):

```bash
export GPG_TTY=$(tty)
```

### tmux

If needed remove/archive the old file, `~/.tmux.conf`.
Then create the following symlink:

```bash
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

### bash-prompt

Add the following line to the end of your `~/.bashrc` file:

```bash
. ~/.dotfiles/bash_prompt.sh
```

### Vim

If needed, create the directories `~/.vim` and `~/.vim/pack/plugins/start`:

```bash
mkdir -p ~/.vim/pack/plugins/start
```

Then, if needed, remove/archive the old files, `~/.vimrc` and `~/.vim/vimrc`
before creating the following symlinks:

```bash
ln -s ~/.dotfiles/vim/vimrc ~/.vim/vimrc
ln -s ~/.dotfiles/vim/pack/plugins/start/* ~/.vim/pack/plugins/start/
```

### NeoVim

If needed, create the directories `~/.local/share/nvim/site/autoload`,
`~/.config/nvim` and `~/.config/nvim/colors`:

```bash
mkdir -p ~/.local/share/nvim/site/autoload
mkdir -p ~/.config/nvim/colors
```

Then, if needed, remove/archive the old files, `~/.config/nvim/init.lua`,
`~/.config/nvim/init.vim` and `~/.local/share/nvim/site/autoload/plug.vim`
before creating the following symlinks:

```bash
ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/nvim/vim-plug/plug.vim \
    ~/.local/share/nvim/site/autoload/.
ln -s ~/.dotfiles/nvim/colors/* ~/.config/nvim/colors/.
```

Do note that the first time you open neovim after this, you might get a bunch
of errors because of missing plugins. Fix that with the `:PlugUpdate` command
(from within NeoVim). You will probably have to quit and open neovim again
(and even might have to repeat that command omce more).
