# Script to create a new folder in a specified drive

# Specify the drive and folder name
$drive = "C:\"
$folderName = "Newfolder"

# Combine the drive and folder name to create the full path
$newFolderPath = Join-Path -Path $drive -ChildPath $folderName

# Check if the folder already exists
if (-Not (Test-Path -Path $newFolderPath)) {
    # Create the folder
    New-Item -ItemType Directory -Path $newFolderPath | Out-Null
    Write-Host "Folder created successfully at $newFolderPath"
} else {
    Write-Host "Folder already exists at $newFolderPath"
}