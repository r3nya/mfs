#!/bin/bash
# Keyboard layout indicator
cp flags ~/.icons/
gconftool-2 --type boolean --set /desktop/gnome/peripherals/keyboard/indicator/showFlags true
