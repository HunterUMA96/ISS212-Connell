#!C:\Program Files\Git\bin\sh.exe

#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 5 - Bash Review
# This script will ping any address provided as an argument.
# usage: bash bash-pingScript.sh <IP Address Here, sans brackets.>

SCRIPT_NAME="${0}"
TARGET="${1}"

echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping "${TARGET}"