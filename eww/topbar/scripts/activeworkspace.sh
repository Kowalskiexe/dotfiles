#!/usr/bin/env bash

echo "starting activeworkspace.sh"
line=""
while read line; do
	active=$(hyprctl activeworkspace -j | jq '.id')
	echo $active
	eww update active-workspace=$active
done
echo "done"
