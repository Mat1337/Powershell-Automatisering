# Check for administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run as an administrator." -ForegroundColor Red
    exit
}

# Define source and destination paths
$sourceFolder = "C:\NewFolder"
$destinationFolder = "C:\Programmer\"

# Check if source folder exists
if (Test-Path -Path $sourceFolder) {
    # Create destination folder if it doesn't exist
    if (-not (Test-Path -Path $destinationFolder)) {
        New-Item -ItemType Directory -Path $destinationFolder | Out-Null
    }

    # Copy the folder and its contents
    Copy-Item -Path $sourceFolder -Destination $destinationFolder -Recurse -Force
    Write-Host "Folder copied successfully to $destinationFolder"
} else {
    Write-Host "Source folder does not exist: $sourceFolder"
}