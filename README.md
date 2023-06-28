# My dotfiles (aka config files)

Those are some of my personal config files.

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

### git, tmux and bash-prompt

If needed remove/archive the old files, `~/.gitconfig` and `~/.tmux.conf`.
Then create the following symlinks:

```bash
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

Create the file `~/.git_private_config` with your private info that should not
be in this repository:

```gitconfig
[user]
    name = Your Name
    email = your@email.com
    signingkey = PGP-signing key
```

**Note:** `PGP-signing key` should be your public PGP-key, if you have one to sign your commits.
See [Managing commit signature verification](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/managing-commit-signature-verification)
for how to create one and add it to your GitHub account. See e.g. [Moving/Copying your PGP 
Keys](https://www.phildev.net/pgp/gpg_moving_keys.html)
for how to copy the private keys between computers.

Add the following line to the end of your `~/.bashrc` file:

```bash
. ~/.dotfiles/bash_prompt.sh
```

If you did add a PGP-key to your private git config, you also need to add the following line to
the end of your `~/.bashrc` file:

```bash
export GPG_TTY=$(tty)
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
