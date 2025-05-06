#!/bin/bash 
# This line tells the computer this is a bash script 
REPO_URL="https://github.com/your_username/your_repo.git" 
REPO_DIR="/path/to/local/repo" 
WEBSITE_DIR="/var/www/your_website" 
# These lines set up some information about where your files are 

# Pull latest changes 
cd $REPO_DIR || exit 
git pull origin main 
# This part goes to your local copy of the website and gets the latest changes 
# Copy files to website directory 
rsync -av --delete $REPO_DIR/ $WEBSITE_DIR/ 
# This copies the new files to where Nginx can find them 

# Restart Nginx 
sudo systemctl restart nginx 
# This restarts Nginx to make sure it sees the new files 

echo "Website updated successfully" 
# This prints a message saying the update is done