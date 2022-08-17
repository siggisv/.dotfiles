My dotfiles (aka config files)
==============================

Those are some of my personal config files.

Installation
------------

First install git if you haven't already done so. Then clone this repository:

    git clone https://github.com/siggisv/.dotfiles.git ~/.dotfiles

If needed, create first the directory `~/.vim` and remove/archive the old
files (i.e. `~/.gitconfig`, `~/.vimrc` and `~/.vim/vimrc`. Then create the
following symlinks:

    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/vim/vimrc ~/.vim/vimrc

**Note:** The config for vim assumes that the terminal has a dark background
that is dark enough so that the color `238` (i.e. rgb: `#444444`), that is
used to mark whitespace characters, is still visible.

Create the file `~/.git_private_config` with your private info that should not
be in this repository:

    [user]
        name = Your Name
        email = your@email.com
        signingkey = PGP-signing key

**Note:** `PGP-signing key` should be your public PGP-key, if you have one to sign your commits.
See [Managing commit signature verification](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/managing-commit-signature-verification)
for how to create one and add it to your GitHub account. See e.g. [Moving/Copying your PGP 
Keys](https://www.phildev.net/pgp/gpg_moving_keys.html)
for how to copy the private keys between computers.

Add the following line to the end of your `~/.bashrc` file:

    . ~/.dotfiles/bash_prompt.sh

**Note:** `bash_prompt.sh` assumes you have downloaded `.git-prompt.sh` from the [git/git github
repository](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
and saved it to your `$HOME` directory.

If you did add a PGP-key to your private git config, you also need to add the following line to
the end of your `~/.bashrc` file:

    export GPG_TTY=$(tty)
