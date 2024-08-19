#!/usr/bin/env bash

line=""
while read line; do
	workspaces_list=()
	for i in {1..10}; do
		workspaces_list+=(false)
	done
	used=$(hyprctl workspaces -j | jq '.[].id' | tr '\n' ' ')
	for workspace in $used; do
        if [[ $workspace -gt 0 ]]; then
		    workspaces_list[$(($workspace - 1))]=true
        fi
	done

	# generate JSON
	json="{ "
	for i in {0..9}; do
		json+="\"$(($i + 1))\": ${workspaces_list[$i]}"
		if [[ $i -lt 9 ]]; then
			json+=", "
		fi
	done
	json+=" }"
	# echo "$json"

	eww update workspaces-in-use="$json"
done
echo "done"
