<#
.SYNOPSIS
    Nester Module for LearningModule
#>

Write-Host "Loading LearningNestedModule2 ..." -ForegroundColor DarkCyan

function Get-LearningVerbosePreference2 {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse
    )
    
    begin {
        if ($Recurse) {
            return Get-LearningVerbosePreference2
        } else {
            return $VerbosePreference
        }
    }    
    process {}    
    end {}
} Export-ModuleMember -Function Get-LearningVerbosePreference2

function Get-ErrorActionPreference2 {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse
    )
    
    begin {
        if ($Recurse) {
            return Get-ErrorActionPreference2
        } else {
            return $ErrorActionPreference
        }
    }
    process {}
    end {}
} Export-ModuleMember -Function Get-ErrorActionPreference2