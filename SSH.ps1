# SSH.ps1
# Connect to another device using PowerShell Remoting over SSH

param(
    [Parameter(Mandatory=$true)]
    [string]$User,

    [Parameter(Mandatory=$true)]
    [string]$Host,

    [int]$Port = 22
)

# Example usage:
# .\SSH.ps1 -User username -Host remotehost

$session = New-PSSession -HostName $Host -UserName $User -Port $Port -SSHTransport

if ($session) {
    Write-Host "Connected to $Host. Entering interactive session..."
    Enter-PSSession -Session $session
    # When done, exit the session and remove it
    Remove-PSSession -Session $session
} else {
    Write-Host "Failed to create SSH session."
}