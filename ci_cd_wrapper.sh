#!/bin/bash 
# Run the Python script to check for changes 
python3 /scripts/check_github.py 

# If the Python script exits with 0 (changes detected), run the update script 
if [ $? -eq 0 ]; then    
    /scripts/Update_website.sh
fi