#!/bin/bash

ASSERT() {
  local MESSAGE=${2:-"Assertion failed"}

  if ! eval "$1"; then
    echo "Assertion failed: $MESSAGE" >&2
    exit 1
  fi
}

IS_PROCESS_RUNNING() {
  local NAME=$1
  pgrep "$NAME" > /dev/null 2>&1
  return $?
}

IS_ALL_PROCESS_RUNNING() {
  if IS_PROCESS_RUNNING "zapzap" && IS_PROCESS_RUNNING "vesktop.bin" && IS_PROCESS_RUNNING "spotify"; then
      return 0
  else
      return 1
  fi
}

# wait for all process to start
while ! IS_ALL_PROCESS_RUNNING; do
  IS_PROCESS_RUNNING "zapzap"
  echo "zapzap: $?"

  IS_PROCESS_RUNNING "vesktop.bin"
  echo "vesktop: $?"

  IS_PROCESS_RUNNING "spotify"
  echo "spotify: $?"
  sleep 0.1
done

ASSERT "IS_PROCESS_RUNNING zapzap" "zapzap should be running"
ASSERT "IS_PROCESS_RUNNING spotify" "spotify should be running"
ASSERT "IS_PROCESS_RUNNING vesktop.bin" "vesktop should be running"

# kill them all
pkill zapzap
pkill vesktop.bin
pkill spotify

# restart them
flatpak run com.spotify.Client &
flatpak run com.rtosta.zapzap &
flatpak run dev.vencord.Vesktop &
