# Check for administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script must be run as an administrator." -ForegroundColor Red
    exit
}

# Create a new default user without a password
# Replace 'NewUser' with the desired username

$UserName = "NewUser"
New-LocalUser -Name $UserName -PasswordNeverExpires -UserMayNotChangePassword
Add-LocalGroupMember -Group "Brugere" -Member $UserName

Write-Host "User $UserName has been created."