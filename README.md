# My dotfiles (aka config files)

Those are some of my personal config files. Most of those (and the following
instructions) assume the OS to be Linux and that the path to this directory to
be `~/.dotfiles`.

## Requirements

- The config for `Vim` assumes that the terminal support at least 256 colours
  and has a dark background. One that is dark enough so that the color `236`
  (i.e. rgb: `#303030`), that is used to mark whitespace characters, is still
  visible.
- The config for `Neovim` assumes:
  - a terminal with 24-bit "truecolour" and cursor-shaping support.
  - that `clangd` has been installed.
  - that some C-compiler (e.g. `gcc` or `clang`) is in the path.

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

*Note* the submodules are only needed if using `Vim`.

### git (on Windows and Linux)

If needed remove/archive the old file, `~/.gitconfig`. Then copy the following
file:

```bash
cp ~/.dotfiles/git/copy_me.gitconfig ~/.gitconfig
```

Edit the copy to replace the parts surrounded by "{" and "}" with the correct
info (also edit the path *IF* the path to this directory is *NOT*
`~/.dotfiles`):

```gitconfig
[include]
    path = ~/.dotfiles/git/.git_my_config
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

### Neovim

#### Add the plugin manager `vim-plug`

Follow the instructions [on installing vim-plug for
Neovim](https://github.com/junegunn/vim-plug#neovim). The needed directories
will be created and the needed file copied. Running the command `:PlugUpgrade`
from within `Neovim`, when needed, will upgrade the plugin manager.

#### Setup the config

If needed, create the default directory, `~/.config/nvim` on Linux or
`~/AppData/Local/nvim` on Windows:

```bash
# Linux:
mkdir -p ~/.config/nvim

# Windows (Powerrshell):
mkdir ~/AppData/Local/nvim
```
If needed remove/archive the old file, `init.vim`, from that directory. Then
copy the following file:

```bash
# Linux:
cp ~.dotfiles/nvim/copy_me.init.vim ~/.config/nvim/init.vim

# Windows (Powerrshell):
cp ~.dotfiles/nvim/copy_me.init.vim ~/AppData/Local/nvim/init.vim
```

*IF* the path to this directory is *NOT* `~/.dotfiles`, then edit the path in
the first line of the copy:

```vimrc
set runtimepath^=~/.dotfiles/nvim
lua require('main_config')
```

Do note that the first time you open `Neovim` after this, you might get a bunch
of errors because of missing plugins. Fix that with the `:PlugUpdate` command
(from within `Neovim`). You will probably have to quit and open `Neovim` again
(and even might have to repeat that command omce more).
