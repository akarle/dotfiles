#!/usr/bin/env bash
# console_theme.sh
# A small script to set the Virtual Console to use Gruvbox colors.
# Colors originally from https://github.com/morhetz/gruvbox by Pavel Pertsev
# For more on escape sequences see console_codes(4)
if [[ "$TERM" =~ "linux" ]]; then
     # Gruvbox 16 colors
     printf "\033]P0282828" # 0:  Black
     printf "\033]P1cc241d" # 1:  Red
     printf "\033]P298971a" # 2:  Green
     printf "\033]P3d79921" # 3:  Yellow
     printf "\033]P4458588" # 4:  Blue
     printf "\033]P5b16286" # 5:  Magenta
     printf "\033]P6689d6a" # 6:  Cyan
     printf "\033]P7a89984" # 7:  White
     printf "\033]P8928374" # 8:  Bright Black
     printf "\033]P9fb4934" # 9:  Bright Red
     printf "\033]Pab8bb26" # 10: Bright Green
     printf "\033]Pbfabd2f" # 11: Bright Yellow
     printf "\033]Pc83a598" # 12: Bright Blue
     printf "\033]Pdd3869b" # 13: Bright Magenta
     printf "\033]Pe8ec07c" # 14: Bright Cyan
     printf "\033]Pfebdbb2" # 15: Bright White
     clear                  # Redraw the screen...
fi
