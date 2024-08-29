<#
.SYNOPSIS
Getting if user is expired

.DESCRIPTION
Show all requests information from the user or users

.PARAMETER username
The user name or all user "*"

.EXAMPLE
# test case
# Get-ExpiredUser -username rcrocha
# Get-ExpiredUser -username "*"
# Get-ExpiredUser

.NOTES
General notes
#>
function Get-ExpiredUser {
        
    [CmdletBinding()]
    param (
        [string]$username = "*"
    )
      Get-ADUser -Identity "$username" -Properties "*" | Select-Object LockedOut, AccountLockoutTime, BadLogonCount    

      Get-ADUser -Identity "$username" -properties PasswordLastSet, PasswordExpired, PasswordNeverExpires | Sort-Object Name | Format-Table Name, PasswordLastSet, PasswordExpired, PasswordNeverExpires
    } 

