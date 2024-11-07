'''
.DESCRIPTION
#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 6 - PowerShell Script: ps-Configure-EventLogging.ps1
Citations:Walkthrough and ChatGPT

.PURPOSE
PowerShell script that enables PowerShell Logging.

.USAGE
run script from file with command or from terminal. | .\ps-Configure-EventLogging.ps1
'''

# Folder path to where logs will be stored and joins path + file name to create new file.
$logFolderPath = "C:\Users\student\Desktop\Edu\F24-212\WK6\scripts\logs"
$logFilePath = Join-Path -Path $logFolderPath -ChildPath "PowerShellEvents.log"

# Displays the folder and log paths in the console for user verification.
Write-Host "Log folder path: $logFolderPath"
Write-Host "Log file path: $logFilePath"

# Checks if log folder exists. If not it creates it.
if (-not (Test-Path -Path $logFolderPath -PathType Container)) {
    Write-Host "Logs folder does not exist. Creating..."
    try {
        New-Item -Path $logFolderPath -ItemType Directory
        Write-Host "Logs folder created successfully."
    } catch {
        Write-Host "Error creating Logs folder: $_"
        exit
    }
} else {
    Write-Host "Logs folder already exists."
}

# Defines registry path for scriptblocklogging settings.
$regPath = "HKLM:\SOFTWARE\Microsoft\PowerShell\ScriptBlockLogging"
Write-Host "Registry path: $regPath"
if (-not (Test-Path -Path $regPath)) {
    Write-Host "Registry key does not exist. Creating..."
    try {
        New-Item -Path $regPath -Force
        Write-Host "Registry key created successfully."
    } catch {
        Write-Host "Error creating registry key: $_"
        exit
    }
} else {
    Write-Host "Registry key already exists."
}

#Configuring the registry values for enablling Script Block Logging and assigning the file path
try {
    Set-ItemProperty -Path $regPath -Name "EnableScriptBlockLogging" -Value 1 -ErrorAction Stop
    Set-ItemProperty -Path $regPath -Name "LogPath" -Value $logFilePath -ErrorAction Stop
    Write-Host "PowerShell event logging has been configured. Events will be logged to $logFilePath."
} catch {
    Write-Host "Error setting registry values: $_"
}

# Defining a function to log events to log file.
function Log-Event {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    # makes a time stamp for each entry
    $Timestamp = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $MessageWithTimestamp = "$Timestamp - $Message"

    #  combines the timestamp with message.
    $MessageWithTimestamp | Out-File -FilePath $logFilePath -Append
}

# Starting of the script via output to the console.
Log-Event "Script started"

# comment here
try {
    $systemInfo = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture
    Log-Event "System information:"
    Log-Event $systemInfo | Out-String
} catch {
    Log-Event "Error retrieving system information: $_"
}

Write-Host "Script execution complete. Please check the log file for details: $logFilePath"
