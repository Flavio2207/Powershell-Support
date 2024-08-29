<#
.Synopsis
Get Information Network Adapter
.Description
This command will get Information in the Network adpater
.Parameter Computername
The name of the computer to check. The default is localhost.
.Example
PS C:\> .\Get-PhysicalAdapters.ps1 -computername "Localhost"
This command will get information Network Adapter.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$True,HelpMessage="Enter a computername to query")]
    [Alias('host')]
    [string]$hostname = 'localhost'
)

Write-Verbose "Loading Information Network Adapter $hostname"
Get-CimInstance win32_networkadapter -ComputerName "$hostname" |
where { $_.PhysicalAdapter } | Select-Object MACAddress,AdapterType,DeviceID,Name,Speed

