<#
.SYNOPSIS
    Nester Module for LearningModule
#>
using Module .\LearningNestedModule2.psm1

Write-Host "Loading LearningNestedModule ..." -ForegroundColor DarkCyan

# function Invoke-Throw {
#     [CmdletBinding()]
#     [Alias('it')]
#     param (
#         [parameter(ValueFromPipeline)] [string] $BoundParameter, 
#         [parameter()] [switch] $OnBegin,
#         [parameter()] [int] $OnProcess,
#         [parameter()] [switch] $OnEnd
#     )

#     begin {
        
#         try {
#             if ($OnBegin) {
#                 throw 'OnBeging'
#                 Write-Host 'We should never see this string'
#             }
    
#             $count = 0  
#         }
#         catch {
#             Write-Error -Message $_.Exception.Message
#             Write-Host 'Line after Write-Error'
#         }
#     }
    
#     process {
#         try {
#                 $count++

#                 "Processing [{0}]" -f $count | Write-Verbose
        
#                 if ($OnProcess) {
#                     if ($count -eq $OnProcess){
#                         throw 'OnProcess on count {0}' -f $count
#                         Write-Host 'We should never see this string'

#                     }
#                 }
#         }
#         catch {
#             Write-Error -Message $_.Exception.Message
#             Write-Host 'Line after Write-Error'

#         }
#     }
    
#     end {
#         if ($OnEnd) {
#             throw 'OnEnd'
#             Write-Host 'We should never see this string'
#         }
#     }
# } Export-ModuleMember -Function Invoke-Throw -Alias 'it'

function Invoke-Throw {
    [CmdletBinding()]
    [Alias('it')]
    param (
        [parameter(ValueFromPipeline)] [string] $BoundParameter, 
        [parameter()] [switch] $OnBegin,
        [parameter()] [int] $OnProcess,
        [parameter()] [switch] $OnEnd
    )

    begin {
        if ($OnBegin) {
            throw 'OnBeging'
            Write-Host 'We should never see this string'
        }

        $count = 0  
    }
    
    process {
     
        $count++

        "Processing [{0}]" -f $count | Write-Verbose

        if ($OnProcess) {
            if ($count -eq $OnProcess){
                throw 'OnProcess on count {0}' -f $count
                Write-Host 'We should never see this string'
            }
        }

        return "Processing [{0}]"
    }

       
    end {
        if ($OnEnd) {
            throw 'OnEnd'
            Write-Host 'We should never see this string'
        }
    }
} Export-ModuleMember -Function Invoke-Throw -Alias 'it'

function Invoke-WriteError {
    [CmdletBinding()]
    [Alias('iwe')]
    param (
        [parameter(ValueFromPipeline)] [string] $BoundParameter, 
        [parameter()] [switch] $OnBegin,
        [parameter()] [int] $OnProcess,
        [parameter()] [switch] $OnEnd
    )

    begin {
        if ($OnBegin) {
            'OnBeging' | Write-Error
        }

        $count = 0  
    }
    
    process {
     
        $count++

        "Processing [{0}]" -f $count | Write-Verbose

        if ($OnProcess) {
            if ($count -eq $OnProcess){
                "OnProcess on count {0}" -f $count | Write-Error
            }
        }

        return "Processing [{0}]" -f $count
    }

    end {
        if ($OnEnd) {
            'OnEnd' | Write-Error
        }
    }
} Export-ModuleMember -Function Invoke-WriteError -Alias 'iwe'

function Get-LearningVerbosePreference {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse,
        [parameter()][switch] $Nested
    )
    
    begin {
        if ($Nested) {
            return Get-LearningVerbosePreference2 -Recurse:$Recurse
        }

        if ($Recurse) {
            return Get-LearningVerbosePreference
        } else {
            return $VerbosePreference
        }
    }    
    process {}    
    end {}
} Export-ModuleMember -Function Get-LearningVerbosePreference

function Get-ErrorActionPreference {
    [CmdletBinding()]
    param (
        [parameter()][switch] $Recurse,
        [parameter()][switch] $Nested

    )
    
    begin {
        if ($Nested) {
            return Get-ErrorActionPreference2 -Recurse:$Recurse
        }

        if ($Recurse) {
            return Get-ErrorActionPreference
        } else {
            return $ErrorActionPreference
        }
    }
    process {}
    end {}
} Export-ModuleMember -Function Get-ErrorActionPreference