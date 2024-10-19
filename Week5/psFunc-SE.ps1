<#
.DESCRIPTION
# Hunter Joseph Connell 10/17/2024
ISS 212 - CS Scripting - PowerShell Script to Parse Windows Event System logs for Error events.

# Purpose: To read from the Windows Event Log, determine if there are more than a certain number of error events,
           and write the result to a text file.
Citation: This script utilizes PowerShell cmdlets and Windows Event Log management, concepts based on ISS 212
           Week 5 course material.

Set the threshold for error events to suit your usecase.
Results are printed to a file named: EventLogCheck.txt that will be created in the same folder as script.
#>

$errorThreshold = 10

# Retrieve the last 100 error events from the System log
$events = Get-WinEvent -LogName System -MaxEvents 100 | Where-Object { $_.LevelDisplayName -eq "Error" }

# Count the number of error events
$numErrors = $events.Count

# Prepare the result message
if ($numErrors -gt $errorThreshold) {
    $resultMessage = "Alert: There are $numErrors error events in the System log, which exceeds the threshold of $errorThreshold."
} else {
    $resultMessage = "The number of error events ($numErrors) is within acceptable limits."
}

# Get the current directory path
$currentDirectory = Get-Location

# Define the output file path
$outputFilePath = Join-Path -Path $currentDirectory -ChildPath "EventLogCheck.txt"

# Write the result to the text file
$resultMessage | Out-File -FilePath $outputFilePath -Append

# Display a message indicating that the script has completed
Write-Output "The script has completed. Results have been written to $outputFilePath."

# Exit the script
exit
