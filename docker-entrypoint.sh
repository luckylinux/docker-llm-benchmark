#!/bin/bash

# Change to App folder
cd "/opt/app" || exit

# Start the main Process and save its PID
# Use exec to replace the shell Script process with the main Process
exec "/opt/app/app.sh" &
pidh=$!

# Trap the SIGTERM signal and forward it to the main process
trap 'kill -SIGTERM $pidh; wait $pidh' SIGTERM

# Wait for the main Process to complete
wait $pidh
