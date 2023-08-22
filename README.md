# ML4ALL
Machine learning material for Jetson nano and HPC starting Fall 2023

# Setup Instructions

1. Make sure you are at home directory: `cd ~`
2. `git clone https://github.com/umdenes100/ML4ALL.git`
3. `nano ~/.bashrc`
      1. Use vim if nano not installed
5. At the bottom, add `alias enes100ml='~/ML4ALL/ml4all.sh'`
6. Save and exit nano: `ctrl+o` then `ctrl+x`
      1. If vim, `escape` then `:wq`
8. `source ~/.bashrc` and test

# Activity

1. Plug in Jetson Power and connect Jetson serial cable to computer USB.
2. Check Device Manger for `COM#`
3. Open PuTTY
4. Switch to Serial selection
5. Type in the `COM#` from Device Manager
6. Type in `115200` for speed
7. Connect
8. Login with u: `jetson` p: `jetson`
9. Make sure USB camera is plugged in
10. Type `enes100ml`
11. Enter name and section
12. Jupyter Notebook should start at unique mount point
      1. Will automatically create this mount point if does not previously exist. Otherwise, will go to existing one of same name.
13. Select an activity and begin!
14. If disconnected, do the same steps, including same name/section in step 11, to get to the same mount point

# Other Notes
To update Jetsons:
1. Push changes to `ML4ALL` repo
2. `git pull` on all of the Jetsons

Start Jupyter Notebook mounted on ML4ALL Repo
1. `./ML4ALL/dev_nb.sh`
