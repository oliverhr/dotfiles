#!/usr/bin/env bash

COMPS_DIR=$HOME/.config/bash/completion.d

for bcfile in $COMPS_DIR/*.bash ; do
	source $bcfile
done

