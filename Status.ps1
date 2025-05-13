# Script to list all instances on the system
Get-Process | Select-Object Name, Id, CPU, StartTime | Sort-Object Name | Format-Table -AutoSize