#!/usr/bin/env bash

# make script a singleton
# https://unix.stackexchange.com/questions/171785/bash-variable-0
umask 000                  # allow all users to access the file we're about to create
exec 9>"/tmp/${0##*/}.lck" # open lockfile on FD 9, based on basename of argv[0]
umask 022                  # move back to more restrictive file permissions
flock -x -n 9 || exit      # grab that lock, or exit the script early


logs_dir="$(dirname "$0")/../logs"

echo 'started_aw'
socat -t1000000 - UNIX-CLIENT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock 2> "$logs_dir/activeworkspace_error.log" \
    | tee "$logs_dir/activeworkspace_socket.log" \
    | "$(dirname "$0")/activeworkspace.sh" &> "$logs_dir/activeworkspace.log"
echo 'end_aw'
