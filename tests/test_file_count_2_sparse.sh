#!/bin/bash

source ./setup.sh

#--

export NOTE_TODAY="2021-04-07"
../note.sh
export NOTE_TODAY="2021-04-10"
../note.sh

#--

assert $((++i)) "__________.....2021-04-07.....2021-04-10" "$NOTE_DIR/2021-04-07"
assert $((++i)) "2021-04-07.....2021-04-10.....__________" "$NOTE_DIR/2021-04-10"

#cat $NOTE_DIR/*

