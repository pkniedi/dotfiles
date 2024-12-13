#!/usr/bin/env python3

from i3ipc import Connection
import asyncio, subprocess, time, os
import notify2

i3 = Connection()

start_time = time.time()
class_map = {
    "firefox": "firefox",
    "anki" : "Anki",
    "kitty": "kitty",
    "keepassxc":"KeePassXC",
        "Alacritty" : "Alacritty"
}

def open_app_on_ws(cmd,ws_nr,window_class) -> None:
    """
    cmd          -- the command to be executed
    ws nr        -- the workspace number on which to execute the command
    window class -- the window class of the application
    """
    i3.command("workspace " + str(ws_nr))
    i3.command("exec " + cmd)
    tree =  i3.get_tree()
    while(len(tree.find_classed(window_class)) == 0):
        tree =  i3.get_tree()

def open_kitty_lr(ws_nr) -> None:
    """
    Opens kitty on the specified window twice with two stacking windows.

    ws nr        -- the workspace number on which to execute the command
    """
    i3.command("workspace " + str(ws_nr))
    i3.command("exec kitty")
    tree =  i3.get_tree()
    while(len(tree.find_classed("kitty")) == 0):
        tree =  i3.get_tree()
    i3.command("exec kitty")
    tree =  i3.get_tree()
    while(len(tree.find_classed("kitty")) == 0):
        tree =  i3.get_tree()
    time.sleep(0.25)
    i3.command("move right")



# open_app_on_ws("keepassxc",1,class_map["keepassxc"])
open_app_on_ws("firefox",1,class_map["firefox"])
open_app_on_ws("alacritty",2,class_map["Alacritty"])
open_app_on_ws("alacritty",3,class_map["Alacritty"])

# open_app_on_ws("kitty",4,class_map["kitty"])
# open_app_on_ws("kitty",5,class_map["kitty"])
# open_app_on_ws("kitty",6,class_map["kitty"])
# open_app_on_ws("kitty",7,class_map["kitty"])
# open_app_on_ws("kitty --hold journalctl -f",8,class_map["kitty"])
# open_app_on_ws("kitty --hold htop",8,class_map["kitty"])
# open_app_on_ws("anki",9,class_map["anki"])


i3.command("workspace 1")
