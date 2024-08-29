<#
.Synopsis
Get Last Boot in the Device 
.Description
This command will get the last time the Device Rebooted
.Parameter Computername
The name of the computer to check. The default is localhost.
.Example
PS C:\> .\Get-LastBoot.ps1 -computername "Localhost"
This command will get the last time the Device Rebooted
#>

function Get-LastBoot {
      [CmdletBinding()]
  
param (

      $computername = '*'

)

Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName "$computername" | Select-Object -Property CSName, LastBootUpTime

}