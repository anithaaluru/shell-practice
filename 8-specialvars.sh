#!/bin/bash
echo "All variables passed to script: $@"
echo "number of variables passed: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "home directory: $HOME"
echo "user: $USER"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command running in background: $!"
