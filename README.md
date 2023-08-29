# ML4ALL
Machine learning material for Jetson nano and HPC starting Fall 2023

# Jetson Lesson Status
Last Updated: 08/23/23
1 & 2: Dev   
3: 08/22/23 Repo :white_check_mark: | Power/Serial Cable :x: | Cam :x: | Wifi :x: | Fan :x:   
4. 08/22/23 Repo :white_check_mark: | Power/Serial Cable :x: | Cam :x: | Wifi :white_check_mark: | Fan :white_check_mark:   
5. 08/22/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :x: | Fan :x:   
6. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
7. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
8. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
9. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
10. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
11. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
12. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
13. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
14. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
20. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:   
21. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
22. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
23. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
24. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
25. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
26. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:    
27. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  
28. 08/23/23 Repo :white_check_mark: | Power/Serial Cable :white_check_mark: | Cam :white_check_mark: | Wifi :white_check_mark: | Fan :x:  


# Jetson Setup Instructions
Connect to wifi: `sudo nmcli dev wifi connect VisionSystem1215-2.4`

1. Make sure you are at home directory: `cd ~`
2. `git clone https://github.com/umdenes100/ML4ALL.git`
3. `nano ~/.bashrc`
      1. Use vim if nano not installed
5. At the bottom, add `alias enes100ml='~/ML4ALL/ml4all.sh'`
6. Save and exit nano: `ctrl+o` then `ctrl+x`
      1. If vim, `escape` then `:wq`
8. `source ~/.bashrc` and test

# Infrastructure Description

## ml4all.sh script

### Alias   
Students will type the command `enes100ml` in the Jetson terminal. Based on setup step 5, this is aliased to the `ml4all.sh` script in the repo.   

### What it does
The script will first update the activity by running a `git pull`. Then, it will prompt students for their name and section, and then create a directory for this. From there, it will launch a jupyter notebook mounted at that directory.

### Options   
There are a few options to run
1. `enes100ml dev` will launch a jupyter notebook using the repo (`~/ML4ALL`) as a mount point. To be used for development.   
2. `enes100ml nogit` will launch the jupyter notebook, but skipping the git pull.
3. `enes100ml dev nogit` is a combo of the last two.   

# Activity Instructions

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
13. In browser, go to `192.168.55.1:8888`
14. p: `dlinano`
15. Select an activity and begin!
16. If disconnected, do the same steps, including same name/section in step 11, to get to the same mount point

# Optional
`sudo apt-get install sl`
`sl`
