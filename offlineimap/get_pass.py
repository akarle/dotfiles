#!/usr/bin/env python2
# Small python script to retrieve encrypted gpg email password
# Heavily inspired by Arch Wiki's offlineimap docs
from subprocess import check_output

def get_pass():
    return check_output("pash show mail/karleco", shell=True).strip("\n")

# If called via CLI, output the password to STDOUT
# Useful for things like GIT_ASKPASS
if __name__ == "__main__":
    print(get_pass())
