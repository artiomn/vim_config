Vim configuration
==================

This is my cross-platform Vim configuration.


Features
--------

- Syntax highlighting (Syntastic).
- Text completion (Youcompleteme).
- Snippets (Snipmate).
- File types settings.
   1. Необязательный шаблон при создании.
   2. Специфичное автодополнение.
   3. Подстветка синтаксиса.
   4. Языковые настройки.

   Основные:
      1. C/C++ IDE.
      2. Python IDE.
      3. Bash IDE.
      4. HTML IDE.

   Прочие:
      1. Ada IDE.


Requirements
------------

- Git
- `Exuberant ctags`

    sudo apt-get install exuberant-ctags


Installation
-----------

Clone this repository in your home dir:

    git clone https://github.com/artiomn/vim_config.git ~/.vim

Goto cloned directory and init submodules:

    cd ~/.vim && git submodule init && git submodule update

Create `~/.vimrc` file with content:
    source ~/.vim/vimrc.vim


Troubles
--------

In the Arch-like systems you must install GVim to support working with a system clipboard.

