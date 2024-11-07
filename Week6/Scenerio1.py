#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 6 - Regex Scenerio 1
#Citations:Walkthrough and ChatGPT

import re

# Load the log file
with open('auth.log', 'r') as file:
    log_data = file.read()

# Define regex pattern to match "Failed password" followed by an IP address
pattern = r"Failed password .* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"

# Find all matching IP addresses in the log file
suspicious_ips = re.findall(pattern, log_data)

# Filter out unique IP addresses
unique_ips = set(suspicious_ips)

# Display unique suspicious IP addresses
print("Suspicious IP addresses:")
for ip in unique_ips:
    print(ip)
