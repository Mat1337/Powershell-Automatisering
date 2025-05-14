# Wupdate.ps1
# This script checks for the newest Windows updates and schedules itself if not already scheduled

# --- Self-scheduling block ---
$taskName = "WindowsUpdateCheck"
$scriptPath = $MyInvocation.MyCommand.Path
schtasks /Query /TN $taskName 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Output "Scheduled task '$taskName' not found. Creating scheduled task..."
    $action = "powershell.exe -ExecutionPolicy Bypass -File `"$scriptPath`""
    schtasks /Create /SC WEEKLY /D TUE /TN $taskName /TR "$action" /ST 13:00 /RL HIGHEST | Out-Null
    Write-Output "Scheduled task '$taskName' created to run every Tuesday at 1 PM."
} else {
    Write-Output "Scheduled task '$taskName' already exists."
}

# --- Windows Update check ---
Write-Output "Searching for Windows updates..."
$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("IsInstalled=0 and Type='Software'")

if ($SearchResult.Updates.Count -eq 0) {
    Write-Output "No new updates found."
} else {
    Write-Output "$($SearchResult.Updates.Count) update(s) found:"
    foreach ($Update in $SearchResult.Updates) {
        Write-Output "- $($Update.Title)"
    }
}