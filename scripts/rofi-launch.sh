#!/usr/bin/env bash


dir="$HOME/.config/rofi/themes/"
theme='box'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
