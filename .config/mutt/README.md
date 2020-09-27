# mutt

Trying `mutt` in pursuit of an email client that sucks less.

## Installation

This folder should be symlinked to the `$XDG_CONFIG_HOME`. But other than that
it is necessary to generate an encrypted password file.

Given that I am using FastMail, they insist on having a one-client one-time
password for each mail client that isn't theirs. So, in this order:

1. Go to FastMail's web client
2. Under Settings create a password
3. Create a GPG key if you don't already have one:

```
gpg --gen-key
```

4. Use that key's public key to encrypt the password (and putt it in a file):

```
echo -n "PASSWORD" | gpg --encrypt -r EMAIL > accounts/karleco.gpg
```

Now, everything should work!
