# ML4ALL
Machine learning material for Jetson nano and HPC starting Fall 2023

# Setup Instructions

1. Make sure you are at home directory: `cd ~`
2. `git clone https://github.com/umdenes100/ML4ALL.git`
3. `nano ~/.bashrc`
      1. Use vim if nano not installed
5. At the bottom, add `alias iluvml='~/ML4ALL/ml4all.sh'`
6. Save and exit nano: `ctrl+o` then `ctrl+x`
7. Re-open shell.

# Activity

1. `iluvml`
2. Enter name and section
3. Jupyter Notebook should start at unique mount point

# Other Notes
To update Jetsons:
1. Push changes to `ML4ALL` repo
2. `git pull` on all of the Jetsons

Start Jupyter Notebook mounted on ML4ALL Repo
1. `./ML4ALL/dev_nb.sh`
