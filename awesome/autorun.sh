#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run albert
run fcitx5
run volumeicon
run nm-applet