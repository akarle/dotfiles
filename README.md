dotfiles
========
Vim, tmux, mutt... hope you enjoy the shell!

What follows is my (ongoing) tooling journey. I'm currently on Linux both at
home and at work, so the support for macOS and Windows is fleeting at best.

Installation
------------
I'm a big believer in the "do it yourself" style of dotfiles. Fork if you'd
like, but don't blindly copy!

These configs work for me, but [definitely aren't for everyone](./etc/vc/README.md).

This all said, to set up a new machine I run:

```sh
$ git clone --bare https://github.com/akarle/dotfiles ~/.cfg
$ git -C ~/.cfg config status.showUntrackedFiles no
$ alias cfg='git --git-dir=$HOME/.cfg --work-tree=$HOME'
$ cfg checkout # resolve any conflicts from existing files...
```
