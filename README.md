# dotfiles

My dotfiles.

## Install

For a full-featured install, with interactive use (bash required) and options to
download my (Neo)Vim configuration along with other things I find useful, use
the [install.sh](bin/install.sh) script:

```sh
# Download the installer
curl -fsSL https://raw.githubusercontent.com/akarle/dotfiles/master/bin/install.sh > install.sh

# Check it looks OK
less install.sh

# Run it!
bash install.sh
```

Currently this installs:

1. These dotfiles
2. My [dotvim](https://github.com/akarle/dotvim) repo (with favorite plugins as
   submodules)
3. The git [bash-completion script](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)

Alternatively, should you just want these dotfiles (and nothing else
downloaded), clone this repo and run [link.sh](link.sh) which will interactively
(and non-destructively) link each of the dotfiles to the proper location.

```sh
git clone https://github.com/akarle/dotfiles
chmod +x dotfiles/bin/link.sh
./link.sh
```
