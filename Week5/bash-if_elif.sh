#!C:\Program Files\Git\bin\sh.exe

#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 5 - Bash Review
# Script checks if input is a file or directory.
# usage:
#      for directory:  bash bash-if_elif.sh "C:\Your\directory\path\"
#      for file:  bash bash-if_elif.sh "C:\Path\to\your\file\filename.extension"

USER_INPUT="$1"

if [[ -z "${USER_INPUT}" ]]; then
    echo "You must provide an argument!"
    exit 1
fi

echo "User input: ${USER_INPUT}"  # Debugging line

# Check if the argument is of type file or directory
if [[ -f "${USER_INPUT}" ]]; then
    echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then
    echo "${USER_INPUT} is a directory."
else
    echo "${USER_INPUT} is not a file or a directory."
fi


