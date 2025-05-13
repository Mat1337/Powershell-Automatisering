# PowerShell script to create a folder in a specified drive

# Specify the drive and folder name
$drive = "C:\"
$folderName = "NewFolder"

# Combine the drive and folder name to create the full path
$folderPath = Join-Path -Path $drive -ChildPath $folderName

# Check if the folder already exists
if (-Not (Test-Path -Path $folderPath)) {
    # Create the folder
    New-Item -ItemType Directory -Path $folderPath | Out-Null
    Write-Host "Folder created at $folderPath"
} else {
    Write-Host "Folder already exists at $folderPath"
}