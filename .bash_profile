#!/usr/bin/env bash
# sourced by login shells (not interactive shells)
# Example:
#   - ssh to Linux --> run bash_profile on login
#   - open new tmux window --> run bashrc
#
# Exception:
#   ** On OSX bash_profile is run by terminal emulators (new tabs, etc) **
#
# Takeaway:
#   ** Write preferences in bashrc, source it from bash_profile **

if [ -r ~/.bashrc ]; then
    source ~/.bashrc
fi