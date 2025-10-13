#!/usr/bin/env bash

echo "starting activeworkspace.sh"
line=""
eww update active-workspace=1
while read line; do
	active=$(hyprctl activeworkspace -j | jq '.id')
	# echo $active
    
  # error checking
  # https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
  re='^[0-9]+$'
  if [[ $active =~ $re ]] ; then
    eww update active-workspace=$active
  fi
done
echo "done"
