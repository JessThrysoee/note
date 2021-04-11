#!/bin/bash

source ./setup.sh

#--

export NOTE_TODAY="2021-04-07"
../note.sh
export NOTE_TODAY="2021-04-08"
../note.sh

#--

assert $((++i)) "__________.....2021-04-07.....2021-04-08" "$NOTE_DIR/2021-04-07"
assert $((++i)) "2021-04-07.....2021-04-08.....__________" "$NOTE_DIR/2021-04-08"

#cat $NOTE_DIR/*

