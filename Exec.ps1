# Script to change the PowerShell execution policy

# Check the current execution policy
Write-Host "Current Execution Policy:" -ForegroundColor Green
Get-ExecutionPolicy

# Prompt the user for the new execution policy
$newPolicy = Read-Host "Enter the new execution policy (e.g., RemoteSigned, Unrestricted, etc.)"

# Change the execution policy
try {
    Set-ExecutionPolicy -ExecutionPolicy $newPolicy -Scope CurrentUser -Force
    Write-Host "Execution policy changed to $newPolicy successfully." -ForegroundColor Green
} catch {
    Write-Host "Failed to change execution policy. Error: $_" -ForegroundColor Red
}

# Display the updated execution policy
Write-Host "Updated Execution Policy:" -ForegroundColor Green
Get-ExecutionPolicy