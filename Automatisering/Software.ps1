# List all installed software on the system

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*,
                  HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Where-Object { $_.DisplayName } |
    Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
    Sort-Object DisplayName |
    Format-Table -AutoSize