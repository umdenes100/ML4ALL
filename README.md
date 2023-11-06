# ML4ALL
Machine learning material for Jetson nano and HPC starting Fall 2023

# Jetson Setup Instructions
Connect to wifi: `sudo nmcli dev wifi connect VisionSystem1215-2.4`

1. Make sure you are at home directory: `cd ~`
2. `git clone https://github.com/umdenes100/ML4ALL.git`
3. `source ML4ALL/setup.sh`
4. Test with `enes100ml`

# Software Infrastructure Description
## ml4all.sh script

### Alias   
Students will type the command `enes100ml` in the Jetson terminal. Based on setup step 3, this is aliased to the `ml4all.sh` script in the repo.   

### What it does
The script will first update the activity by running a `git pull`. Then, it will go to one of two scripts, likely the student script, which will prompt students for their name and section, and then create a directory for this. From there, it will launch a jupyter notebook mounted at that directory.     
The two scipts are `student_nb.sh` and `dev_nb.sh`, the first of which will run for students and the second will run for development. See Options section below.
For the mission, students will type "mission" as an option.

### Options   
There are a few options to run
1. `dev` wil launch a jupyter notebook using the repo (`~/ML4ALL`) as a mount point. To be used for development.   
2. `nogit` will launch the jupyter notebook, but skipping the git pull.
3. `mission` will copy code from the mission material instead of the lesson material.

Note: Any combination of the above commands will work EXCEPT for `dev` and `mission` together.

***NOTE THIS DIAGRAM IS OUTDATED AND DOES NOT INCLUDE MISSION OPTIONS - TOOD UPDATE THIS DIAGRAM***

![Untitled](https://github.com/umdenes100/ML4ALL/assets/99224714/7ca94f65-dfab-40dd-8bbf-030c990bcb34)


# Activity Instructions

1. Plug in Jetson Power and connect Jetson serial cable to computer USB.
2. Check Device Manger for `COM#` (should be under Ports (COM & LPT) or something similar)    
3. Open PuTTY
4. Switch to Serial selection
5. Type in the `COM#` from Device Manager
6. Type in `115200` for speed
7. Connect
8. ![image](https://github.com/umdenes100/ML4ALL/assets/99224714/b237908f-3fdc-4bfa-ad2c-a8080693e28b)     
9. Login with u: `jetson` p: `jetson`
10. Make sure USB camera is plugged in
11. Type `enes100ml`
12. Enter name and section
13. Jupyter Notebook should start at unique mount point
      1. Will automatically create this mount point if does not previously exist. Otherwise, will go to existing one of same name.
14. In browser, go to `192.168.55.1:8888`
15. p: `dlinano`
16. Select an activity and begin!
17. If disconnected, do the same steps, including same name/section in step 11, to get to the same mount point
18. **IMPORTANT:** When switching between activities, SHUT DOWN then RESTART the Python Kernel!

# Debugging Notes

## Common Errors
| Error | Fix | 
| ----- | ----- | 
| `docker: Error response from daemon: error gathering device information while adding custom device "/dev/video0": no such file or directory.` | Webcam not recognized - plug in if not, or unplug and plug back in, and try again | 
| `RuntimeError: Could not initialize camera.  Please see error trace.` or `RuntimeError: Could not read image from camera.` | Multiple camera instances are up. You MUST shutdown and restart kernel between notebooks due to camrea singleton. First, shutdown the active kernals: ![image](https://github.com/umdenes100/ML4ALL/assets/99224714/bba70584-a5b3-46c0-8a27-2eecfc3e0bee) .      Next, restart the kernel using the ![image](https://github.com/umdenes100/ML4ALL/assets/99224714/887301b2-1686-464a-95be-5167923d53e2) button at the top of the notebook. |  
| If were are issues with the files, directory, etc. **Or if enes100ml does not do anything** (i.e. it says something is missing, fails to find a command, etc.), just redownload the repo. |  `git fetch origin` then `git reset --hard origin/master` |    
| If `enes100ml` is not recognized | Instead, run `~/ML4ALL/ml4all.sh` |    


A common issue you may run into is the ESPCAM losing power. When this happens, re-run the ***THIRD CODE BLOCK*** only and then re-run the last block, and the cam should be restarted. ***A KERNEL RESET MAY BE NECESSARY TOO***, but hopefully not.

# Jetson Lesson Status
See document:
https://docs.google.com/document/d/12A-VtwHe5i3T9NnCDX1o_Y-TG8Wg8F4KKObE5diXDD8/edit?usp=sharing

# Optional
`sudo apt-get install sl`
`sl`
