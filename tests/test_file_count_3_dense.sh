#!/bin/bash

source ./setup.sh

#--

export NOTE_TODAY="2021-04-07"
../note.sh
export NOTE_TODAY="2021-04-08"
../note.sh
export NOTE_TODAY="2021-04-09"
../note.sh

#--

assert $((++i)) "__________.....2021-04-07.....2021-04-08" "$NOTE_DIR/2021-04-07"
assert $((++i)) "2021-04-07.....2021-04-08.....2021-04-09" "$NOTE_DIR/2021-04-08"
assert $((++i)) "2021-04-08.....2021-04-09.....__________" "$NOTE_DIR/2021-04-09"

#cat $NOTE_DIR/*

