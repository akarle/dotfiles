# dotfiles/etc/perl

The `cpanfile` contains all the CPAN modules I like to install
for Perl development. See also the [.perldb](.perldb) file for
history in the Perl debugger.

To install them, first install `cpanm`, and then run:

```sh
cpanm --installdeps /path/to/dotfiles/etc/perl
```
