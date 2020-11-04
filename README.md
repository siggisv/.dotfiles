My dotfiles (aka config files)
==============================

Those are some of my personal config files.

Installation
------------

First install git if you haven't already done so. Then clone this repository:

    git clone https://github.com/siggisv/.dotfiles.git ~/.dotfiles

Create symlinks (making sure to have removed/archived old files if needed):

    ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/.vimrc ~/.vimrc

Create the file `~/.git_private_config` with your private info that should not
be in this repository:

    [user]
        name = Your Name
        email = your@email.com
        signingkey = PGP-signing key

Add the following line to the end of your `~/.bashrc` file:


    . ~/.dotfiles/bash_prompt.sh

Download `.git-prompt.sh` from the [git/git github
repository](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
and save it to your `$HOME` directory.
