#! /usr/bin/env bash

if pidof hypridle 1> /dev/null; then
	hypridle_status="True"
else
	hypridle_status="False"
fi

echo "{\"tooltip\": \"$hypridle_status\"}"
