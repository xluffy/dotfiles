#!/bin/bash

trash=(xmonad.errors xmonad.hi xmonad.o xmonad-x86_64-linux)

for f in "${trash[@]}"; do
  rm -f "$f"
done
