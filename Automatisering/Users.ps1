# Requires: ActiveDirectory module
# Lists all users in Active Directory and local users

# Try to import the Active Directory module if available
if (Get-Module -ListAvailable -Name ActiveDirectory) {
    Import-Module ActiveDirectory
    Write-Host "Active Directory users:" -ForegroundColor Cyan
    Get-ADUser -Filter * | Select-Object Name, SamAccountName, Enabled
} else {
    Write-Host "Active Directory module not found. Skipping AD users." -ForegroundColor Yellow
}

Write-Host "`nLocal users:" -ForegroundColor Cyan
Get-LocalUser | Select-Object Name, Enabled