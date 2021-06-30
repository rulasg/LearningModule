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

function Get-LearningErrorActionPreference2 {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse
    )
    
    begin {
        if ($Recurse) {
            return Get-LearningErrorActionPreference2
        } else {
            return $ErrorActionPreference
        }
    }
    process {}
    end {}
} Export-ModuleMember -Function Get-LearningErrorActionPreference2

function Get-LearningErrorActionPreferenceWithPSCmdletVariable2 {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse
    )
    
    begin {
        if ($Recurse) {
            return Get-LearningErrorActionPreferenceWithPSCmdletVariable2
        } else {
            return $PSCmdlet.GetVariableValue('ErrorActionPreference')
        }
    }
    process {}
    end {}
} Export-ModuleMember -Function Get-LearningErrorActionPreferenceWithPSCmdletVariable2