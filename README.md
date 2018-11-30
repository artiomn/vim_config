Vim configuration
==================

This is my cross-platform Vim configuration.


Requirements
------------

- Git
- `Exuberant ctags`

    sudo apt-get install exuberant-ctags


Instalation
-----------

Clone this repository in your home dir:

    git clone https://github.com/artiomn/vim_config.git ~/.vim

Goto cloned directory and init submodules:

    cd ~/.vim && git submodule init && git submodule update

Create `~/.vimrc` file with content:
    source ~/.vim/vimrc.vim
