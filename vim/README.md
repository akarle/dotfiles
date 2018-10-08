# dotvim

My personal Vim configuration.

This used to be part of my personal
[dotfiles](https://github.com/akarle/dotfiles), but I promoted it to its own
repo for greater portability and a cleaner history.

## Install

Mac/Linux:

```sh
git clone https://github.com/akarle/dotvim ~/.vim
```

Windows:

```sh
git clone https://github.com/akarle/dotvim ~\vimfiles
```

Note that in Vim 7.4 and newer **you don't need to symlink `~/.vim/vimrc` to
`~/.vimrc`**, making a one directory repo a cleaner and more portable option!

However, if an old `~/.vimrc` file exists, it will be sourced before and instead
of `~/.vim/vimrc`. If you don't see expected behavior, you can always check the
loaded files with `:scriptnames` to diagnose the issue.
