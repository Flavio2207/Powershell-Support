<#
.SYNOPSIS
    Returns weather report information.
.DESCRIPTION
    Console-oriented weather forecast that returns weather information for specified parameters.
.EXAMPLE
    Get-Weather

    Returns full weather information based on the location of your IP with all defaults.
.EXAMPLE
    Get-Weather -Short

    Returns basic weather information based on the location of your IP.
.EXAMPLE
    Get-Weather -City 'London' -Units Metric -Language 'en'

    Returns full weather information for the city of London in Metric units with UK language.
.EXAMPLE
    Get-Weather -City 'San Antonio' -Units USCS -Short

    Returns basic weather information for the city of San Antonio in United State customary units.
.PARAMETER City
    The city you would like to get the weather from. If not specified the city of your IP is used.
.PARAMETER Units
    Units to display Metric vs United States customary units
.PARAMETER Language
    Language to display results in
.PARAMETER Short
    Will return only basic weather information
.NOTES
    https://github.com/chubin/wttr.in
    https://wttr.in/:help
#>
function Get-Clima {
    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory = $false
        )]
        [string]
        $City,

        [Parameter(Position = 1)]
        [ValidateSet('Metric', 'USCS')]
        [string]
        $Units = 'USCS',

        [Parameter(Position = 2)]
        [ValidateSet('ar', 'af', 'be', 'ca', 'da', 'de', 'el', 'en', 'et', 'fr', 'fa', 'hu', 'ia', 'id', 'it', 'nb', 'nl', 'pl', 'pt-br', 'ro', 'ru', 'tr', 'th', 'uk', 'vi', 'zh-cn', 'zh-tw')]
        [string]
        $Language = 'pt-br',

        [Parameter(Position = 3)]
        [switch]
        $Short
    )

    $uriString = 'https://wttr.in/'

    if ($City) {
        $uriString += "$City"
    }

    switch ($Units) {
        'Metric' {
            $uriString += "?m"
        }
        'USCS' {
            $uriString += "?u"
        }
    }

    if ($Short) {
        $uriString += "&format=4"
    }

    $uriString += "&lang=$Language"

    Write-Verbose "URI: $uriString"

    $invokeSplat = @{
        Uri         = $uriString
        ErrorAction = 'Stop'
    }

    try {
        Invoke-RestMethod @invokeSplat
    }
    catch {
        Write-Error $_
    }
}#Get-Weather

# ----------------------------------------------
# Begin Process End
# ----------------------------------------------