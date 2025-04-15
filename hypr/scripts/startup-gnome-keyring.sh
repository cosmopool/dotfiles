#!/bin/bash

eval $(gnome-keyring-daemon --start --components=ssh,secrets,pkcs11)
export SSH_AUTH_SOCK="$GNOME_KEYRING_CONTROL/ssh"
