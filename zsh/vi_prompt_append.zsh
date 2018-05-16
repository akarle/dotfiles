# Vi Prompt Append!
#
# I like Vi(m) related things! I like Vi in my zsh, BUT, not knowing
# which mode (Normal/Insert) you are in can be damaging. SO, I created
# this little script to append an indicator (and change it) for any
# zsh theme!
#
# Assumes bindkey -v is on!
#
# USAGE:
# Source AFTER your theme! (so prompt isn't reset!)

# First, the globals
VI_NORMAL_PROMPT="%{$fg_bold[yellow]%}[% N]%  %{$reset_color%}"
VI_INSERT_PROMPT="%{$fg_bold[blue]%}[% I]%  %{$reset_color%}"
VI_PROMPT_CHAR="$VI_INSERT_PROMPT"

# Simple function to output the Vi prompt
vi_mode() {
    local vi_mode_chars="${VI_PROMPT_CHAR}"
    echo -n "$vi_mode_chars"
}

# The magic is here -- append to PROMPT
# Note to self -- need '' around the vi_mode function
PROMPT='$(vi_mode)'"$PROMPT"

# This function changes the prompt / resets it on Normal/Insert toggle
# Heavily inspired by Doug Black (https://dougblack.io/words/zsh-vi-mode.html)
function zle-line-init zle-keymap-select {
    # for use in my custom vi prompt append
    VI_PROMPT_CHAR="${${KEYMAP/vicmd/$VI_NORMAL_PROMPT}/(main|viins)/$VI_INSERT_PROMPT}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
