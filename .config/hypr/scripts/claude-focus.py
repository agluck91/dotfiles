#!/usr/bin/env python3
import socket, subprocess, os

sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE", "")
runtime = os.environ.get("XDG_RUNTIME_DIR", "/run/user/1000")
sock_path = f"{runtime}/hypr/{sig}/.socket2.sock"

was_quick_entry = False

with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
    s.connect(sock_path)
    buf = ""
    while True:
        data = s.recv(4096).decode("utf-8", errors="ignore")
        if not data:
            break
        buf += data
        while "\n" in buf:
            line, buf = buf.split("\n", 1)
            if ">>" not in line:
                continue
            event, _, payload = line.partition(">>")
            if event == "activewindow":
                cls = payload.split(",")[0]
                if cls == "claude-quick-entry":
                    was_quick_entry = True
                elif was_quick_entry:
                    was_quick_entry = False
                    subprocess.run(["hyprctl", "dispatch", "focuswindow", "class:^(claude)$"])
