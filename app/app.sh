#!/bin/bash

# Change to app folder
cd "/opt/app" || exit

# Set Timezone using environment
ln -snf "/usr/share/zoneinfo/${TIMEZONE:-UTC}" "/etc/localtime"

# Start Ollama
nohup ollama serve &

# Infinite Loop
# Also needed if the Main Script/App doesn't have a looping itself, preventing the Container from Stopping
if [[ "${ENABLE_INFINITE_LOOP}" == "true" ]]
then
   echo "Starting Infinite Loop"
   while true
   do
      sleep 5
   done
fi
