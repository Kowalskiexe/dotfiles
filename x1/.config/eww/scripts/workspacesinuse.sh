#!/usr/bin/env bash

echo "Starting workspace in use"
line=""
eww update workspaces-in-use='{"1": false, "2": false, "3": false, "4": false, "5": false, "6": false, "7": false, "8": false, "9": false, "10": false, "11": false, "12": false, "13": false, "14": false, "15": false, "16": false, "17": false, "18": false, "19": false}'
while read line; do
    echo "line: $line"
	workspaces_list=()
	for i in {1..20}; do
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
	for i in {0..19}; do
		json+="\"$(($i + 1))\": ${workspaces_list[$i]}"
		if [[ $i -lt 19 ]]; then
			json+=", "
		fi
	done
	json+=" }"
	echo "$json"

	eww update workspaces-in-use="$json"
done
echo "done"
