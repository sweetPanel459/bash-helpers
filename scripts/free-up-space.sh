#! /bin/bash

temp_files() {
   sudo rm -rf /tmp/*
   sudo rm -rf /var/tmp/*
}

cache() {
   sudo apt clean
   sudo apt autoremove
}

old_records() { # registers
   sudo journalctl --vacuum-time=3d
}

trash() {
   rm -rf ~/.local/share/Trash/*
}

log() {
   sudo find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
}

if [ -z "$1" ]; then
   temp_files
   cache
   old_records
   trash
   log
else
   $1
fi
