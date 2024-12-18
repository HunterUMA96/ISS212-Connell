﻿'''
DESCRIPTION
#Hunter Joseph Connell 10/17/2024
# ISS 212 CS Scripting - WK 6 - PowerShell Script: ps-SysHealthCheck.ps1
Citations:Walkthrough and ChatGPT

.PURPOSE
PowerShell script that enables PowerShell Event, Module, and Script Block Logging.

.USAGE
Run script from file with command or from terminal. | .\ps-SysHealthCheck.ps1
'''

Write-Host "System Health Check:"
Write-Host "---------------------"

# Gets and shows info on dispace on C: drive
try {
    $disk = Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DeviceID -eq "C:"}
    if ($disk) {
        Write-Host "Disk Space Usage: $($disk.FreeSpace / 1GB)GB free of $($disk.Size / 1GB)GB ($([math]::Round($disk.FreeSpace / $disk.Size * 100, 2))% free)"
    } else {
        Write-Host "Could not retrieve disk space information."
    }
} catch {
    Write-Host "Error retrieving disk space information: $_"
}

Write-Host "---------------------"

#  Does the same but with the CPU load percentages.
Write-Host "CPU Usage:"
try {
    Get-CimInstance Win32_Processor | ForEach-Object { Write-Host "CPU Load: $($_.LoadPercentage)%"; }
} catch {
    Write-Host "Error retrieving CPU usage information: $_"
}

Write-Host "---------------------"

# Displays RAM information.
Write-Host "Memory Usage:"
try {
    $memory = Get-CimInstance Win32_OperatingSystem
    if ($memory) {
        $usedMemory = ($memory.TotalVisibleMemorySize - $memory.FreePhysicalMemory) / 1MB
        $totalMemory = $memory.TotalVisibleMemorySize / 1MB
        Write-Host "Used Memory: $([math]::Round($usedMemory, 2))MB of $([math]::Round($totalMemory, 2))MB"
    } else {
        Write-Host "Could not retrieve memory usage information."
    }
} catch {
    Write-Host "Error retrieving memory usage information: $_"
}

Write-Host "---------------------"

# All OS info to be displayed too.
Write-Host "Operating System Information:"
try {
    $os = Get-CimInstance Win32_OperatingSystem
    if ($os) {
        Write-Host "OS Name: $($os.Caption)"
        Write-Host "Version: $($os.Version)"
        Write-Host "Architecture: $($os.OSArchitecture)"
    } else {
        Write-Host "Could not retrieve operating system information."
    }
} catch {
    Write-Host "Error retrieving operating system information: $_"
}
