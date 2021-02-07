My dotfiles (aka config files)
==============================

Those are some of my personal config files.

Installation
------------

First install git if you haven't already done so. Then clone this repository:

    git clone https://github.com/siggisv/.dotfiles.git ~/.dotfiles

Create symlinks (if needed, remove/archive old files first):

    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.vimrc ~/.vimrc

**Note:** The config for vim assumes a dark backround and that color `8` (dark gray) is close
enough to the backround color so as using it to mark whitespace characters does not disturb
the flow of reading while still being different enough to be visible (e.g. `#585858` on a 
black background).

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
