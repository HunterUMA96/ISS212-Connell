#!C:\Program Files\Git\bin\sh.exe

#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 6 - Regex Scenerio 2
#Citations:Walkthrough and ChatGPT

# Use sed to redact IP addresses in access.log, saving output to access_redacted.log
sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[REDACTED]/g' access.log > access_redacted.log

# Confirmation message
echo "Redacted IP addresses in access.log and saved as access_redacted.log"
