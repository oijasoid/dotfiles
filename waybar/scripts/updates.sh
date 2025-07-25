#!/bin/bash

PACKAGES=$(checkupdates | column -t | awk '{printf "%s\\r", $0}')
PACKAGES="${PACKAGES%\\r}"
NUM="${PACKAGES//[^,>]}"
NUM="${#NUM}"

# $text\n$tooltip
echo -e "$NUM\n$PACKAGES"
