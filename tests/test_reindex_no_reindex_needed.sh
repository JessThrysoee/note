#!/bin/bash

source ./setup.sh

#--

export NOTE_TODAY="2021-04-07"
../note.sh
export NOTE_TODAY="2021-04-10"
../note.sh
export NOTE_TODAY="2021-04-13"
../note.sh

#--

../note.sh --reindex

#--

assert $((++i)) "__________.....2021-04-07.....2021-04-10" "$NOTE_DIR/2021-04-07"
assert $((++i)) "2021-04-07.....2021-04-10.....2021-04-13" "$NOTE_DIR/2021-04-10"
assert $((++i)) "2021-04-10.....2021-04-13.....__________" "$NOTE_DIR/2021-04-13"

#cat $NOTE_DIR/*

