#!/usr/bin/env python3
print('hiii0')

import socket
import os
import time

socket_file = f'/tmp/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'

client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

print('hiii')

try:
    client_socket.connect(socket_file)
    while True:
        response = client_socket.recv(1024)
        print(response.decode('utf-8'), end="")
finally:
    client_socket.close()

    print('byee')

