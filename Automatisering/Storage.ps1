# Lists all storage devices with their media type and size

Get-PhysicalDisk | Select-Object FriendlyName, MediaType, Size | Format-Table -AutoSize