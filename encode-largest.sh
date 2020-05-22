#!/bin/sh
/opt/automator/manual.py -i "$(find /mnt/media/series -xdev -type f -size +100M -exec ls -la {} \;  | grep -v '.mp4' |  sort -nk 5 | tail -n1 | awk '{ print substr($0, index($0,$9)) }')" -a
/opt/automator/manual.py -i "$(find /mnt/media/movies -xdev -type f -size +100M -exec ls -la {} \;  | grep -v '.mp4' |  sort -nk 5 | tail -n1 | awk '{ print substr($0, index($0,$9)) }')" -a
/opt/automator/manual.py -cmp4 -nt -i "$(find /mnt/media/sport -xdev -type f -size +100M -exec ls -la {} \;  | grep -v '.mp4' |  sort -nk 5 | tail -n1 | awk '{ print substr($0, index($0,$9)) }')"