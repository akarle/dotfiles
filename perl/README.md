# dotfiles/perl

Just a collection of files related to Perl that are useful to me.

Some highlights:

* `perldb`  -- the Perl debugger config
* `cpanfile` -- a list of modules I can't live without (and install on any new
  machine)

## Installation

1. Symlink perldb to ~/.perldb
2. Install `cpanm` and run the following:

```sh
cpanm --installdeps /path/to/dotfiles/perl
```
