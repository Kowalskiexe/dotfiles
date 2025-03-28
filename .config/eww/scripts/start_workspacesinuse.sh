#!/usr/bin/env bash

# Starts workspacesinuse.sh script and feeds it with raw data from hyprland's socket

# make script a singleton
# https://unix.stackexchange.com/questions/171785/bash-variable-0
umask 000                  # allow all users to access the file we're about to create
exec 9>"/tmp/${0##*/}.lck" # open lockfile on FD 9, based on basename of argv[0]
umask 022                  # move back to more restrictive file permissions
flock -x -n 9 || exit      # grab that lock, or exit the script early

logs_dir="$(dirname "$0")/../logs"
mkdir -p "$logs_dir"

touch "$logs_dir/workspacesinuse_error.log"
touch "$logs_dir/workspacesinuse_socket.log"
touch "$logs_dir/workspacesinuse.log"

echo 'started_wiu'
socat -t1000000 - "UNIX-CLIENT:/$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" 2>> "$logs_dir/workspacesinuse_error.log" \
    | tee "$logs_dir/workspacesinuse_socket.log" \
    | "$(dirname "$0")/workspacesinuse.sh" &>> "$logs_dir/workspacesinuse.log"
echo 'end_wiu'
