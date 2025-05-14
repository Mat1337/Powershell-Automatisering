# Show system processes
Write-Host "=== Running Processes ==="
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU, WS | Format-Table -AutoSize

# Show memory information
Write-Host "`n=== Memory Information ==="
Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory |
ForEach-Object {
    $total = [math]::Round($_.TotalVisibleMemorySize / 1MB, 2)
    $free = [math]::Round($_.FreePhysicalMemory / 1MB, 2)
    Write-Host "Total Memory: $total GB"
    Write-Host "Free Memory: $free GB"
}

# Show CPU core information
Write-Host "`n=== CPU Information ==="
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed | Format-Table -AutoSize

# Show graphics information
Write-Host "`n=== Graphics Information ==="
Get-CimInstance Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion |
ForEach-Object {
    $ramGB = if ($_.AdapterRAM) { [math]::Round($_.AdapterRAM / 1GB, 2) } else { "N/A" }
    Write-Host "Name: $($_.Name)"
    Write-Host "RAM: $ramGB GB"
    Write-Host "Driver Version: $($_.DriverVersion)"
    Write-Host ""
}

# Show disk information
Write-Host "`n=== Disk Information ==="
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, VolumeName, Size, FreeSpace |
ForEach-Object {
    $sizeGB = if ($_.Size) { [math]::Round($_.Size / 1GB, 2) } else { "N/A" }
    $freeGB = if ($_.FreeSpace) { [math]::Round($_.FreeSpace / 1GB, 2) } else { "N/A" }
    Write-Host "Drive: $($_.DeviceID) ($($_.VolumeName))"
    Write-Host "  Size: $sizeGB GB"
    Write-Host "  Free: $freeGB GB"
}

# Show network adapter information
Write-Host "`n=== Network Adapter Information ==="
Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled } | 
Select-Object Description, MACAddress, IPAddress, DefaultIPGateway |
ForEach-Object {
    Write-Host "Adapter: $($_.Description)"
    Write-Host "  MAC Address: $($_.MACAddress)"
    Write-Host "  IP Address: $($_.IPAddress -join ', ')"
    Write-Host "  Gateway: $($_.DefaultIPGateway -join ', ')"
    Write-Host ""
}

# Show OS information
Write-Host "`n=== Operating System Information ==="
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime |
ForEach-Object {
    Write-Host "OS: $($_.Caption)"
    Write-Host "Version: $($_.Version) (Build $($_.BuildNumber))"
    Write-Host "Architecture: $($_.OSArchitecture)"
    Write-Host "Last Boot: $($_.LastBootUpTime)"
}