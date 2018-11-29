# dotfiles

My dotfiles.

I found that most of my customization was going to Vim, so I promoted it to its
own repo, [dotvim](https://github.com/akarle/dotvim).

Note that the install will still download it!

## Install

Note that bash is required for this install (as some of the interactive options depend on bash).

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/akarle/dotfiles/master/bin/install.sh)"
```

## Trying it Out

You can try these on for size in a completely isolated environment by using
Docker (which must be installed separately).

```sh
# From within this repo, build from Dockerfile
docker build -t akarledots .

# Run container interactively
docker run -it akarledots

# ------ INSIDE CONTAINER ------
./install.sh
```
