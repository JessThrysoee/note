#!/bin/bash

source ./setup.sh

#--

export NOTE_TODAY="2021-04-10"
../note.sh

#--

assert $((++i)) "__________.....2021-04-10.....__________" "$NOTE_DIR/$NOTE_TODAY"


#cat $NOTE_DIR/*

