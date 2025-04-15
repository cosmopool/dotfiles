#!/usr/bin/fish
# from: https://gist.github.com/kppullin/93ecf587d91b40f30ca0f1f374fbc6ee

pgrep gnome-keyring-d > /dev/null

if test $status -eq 0
  gnome-keyring-daemon | read --line gnome_keyring_control ssh_auth_sock

  set -Ux GNOME_KEYRING_CONTROL (string split -m 1 = $gnome_keyring_control)[2]
  set -Ux SSH_AUTH_SOCK $GNOME_KEYRING_CONTROL
else
  echo "no gnome keyring"
end
