#!bin/bash

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running in this script: $USER"
echo "hostname: $HOSTNAME"
echo "Process id of the current shell script: $$"
sleep 60 &