# List all error events from all event logs

Get-EventLog -List | ForEach-Object {
    Get-EventLog -LogName $_.Log -EntryType Error -ErrorAction SilentlyContinue
} | Select-Object TimeGenerated, Log, Source, EventID, Message | Format-Table -AutoSize