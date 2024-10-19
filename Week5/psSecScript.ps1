<#
.DESCRIPTION
Hunter Joseph Connell 10/17/2024
ISS 212 PowerShell IOCs Script
psSecScript.ps1

.PARAMETER DirectoryPath
The directory path to scan for potentially malicious files. "C:\Users\student\Desktop\Edu\F24-212\WK5\cscripts"

.PARAMETER LogFile
The log file to record potential threats. "psSecScript-ioc-log.txt"

#>

param (
    [string]$DirectoryPath,
    [string]$LogFile
)

function Detect-Threat {
    <#
    .SYNOPSIS
    Detects potential threats in files.

    .DESCRIPTION
    This function scans files in the specified directory for known IoCs.

    .PARAMETER DirectoryPath
    The directory path to scan for potentially malicious files.

    .PARAMETER LogFile
    The log file to record potential threats.

    .EXAMPLE
    Detect-Threat -DirectoryPath "C:\Users\student\Desktop\Edu\F24-212\WK5\cscripts"
    #>
    param (
        [string]$DirectoryPath,
        [string]$LogFile
    )

    Write-Host "Scanning files in $DirectoryPath for potential threats..."

    # List of known IoCs (replace with your own IoCs)
    $IoCs = @(
        "fakemalwarefile.exe",
        "fakesuspicious.dll",
        "fauxphishing.docx"
    )

    # Iterate through files in the directory
    $Files = Get-ChildItem -Path $DirectoryPath -File
    foreach ($File in $Files) {
        $FileName = $File.Name

        # Check if the file name matches any IoC
        $MatchedIoCs = $IoCs | Where-Object { $FileName -like "*$_*" }

        if ($MatchedIoCs.Count -gt 0) {
            Write-Host "Potential threat detected: $FileName"
            Add-Content -Path $LogFile -Value "Potential threat detected: $FileName"

            # Perform additional actions (e.g., quarantine, alert)
            # Uncomment and customize the actions as needed
            # Invoke-ActionOnThreat -FilePath $File.FullName
        }
    }

    Write-Host "Threat detection complete. Log saved to $LogFile."
}

# Main script body
Write-Host "Starting Malicious File Detection Script..."

# Call the threat detection function
Detect-Threat -DirectoryPath "C:\Users\Huntc\OneDrive\Desktop\Fall 24 Semester\FakeMalware" -LogFile "psSecScript-ioc-log.txt"

# End of script
Write-Host "Malicious File Detection Script completed."
