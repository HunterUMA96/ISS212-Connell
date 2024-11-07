#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 6 - Regex Scenerio 3
#Citations:Walkthrough and ChatGPT

# Define log file path and pattern for failed login attempts
$logFile = "security.log"
$failedAttempts = Select-String -Path $logFile -Pattern "Login attempt failed from IP (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})" -AllMatches

# Create an array for IP counts
$ipCounts = @{}

# Copy over matches to count occurrences of each IP
foreach ($match in $failedAttempts) {
    $ip = $match.Matches.Groups[1].Value
    if ($ipCounts.ContainsKey($ip)) {
        $ipCounts[$ip] += 1
    } else {
        $ipCounts[$ip] = 1
    }
}

# Output IPs with more than 3 failed login attempts as suspicious
Write-Host "Potentially Malicious IPs:"
foreach ($ip in $ipCounts.Keys) {
    if ($ipCounts[$ip] -gt 3) {
        Write-Host "$ip has $($ipCounts[$ip]) failed login attempts"
    }
}
