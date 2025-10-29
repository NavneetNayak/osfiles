if area=$(slurp); then grim -g "$area" - | tee >(wl-copy) > ~/Pictures/screenshots/$(date +%F_%T)_scrn.png && dunstify "Screenshot of region taken and saved as $(date +%F_%T)_scrn.png" -t 3000; fi 
