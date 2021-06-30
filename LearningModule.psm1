<# 
.Synopsis 
LearningModule

.Description
Learning bench for powershell programming

.Notes 
NAME  : LearningModule.psm1*
AUTHOR: raulg.    

CREATED: 02/01/2021
#>
using Module .\LearningNestedModule.psm1
# Import-Module .\LearningNestedModule.psd1 -Verbose

Write-Host "Loading LearningModule ..." -ForegroundColor DarkCyan

Export-ModuleMember -Function Invoke-Throw -Alias 'it'
Export-ModuleMember -Function Invoke-WriteError -Alias 'iwe'

Export-ModuleMember -Function Get-LearningVerbosePreference
Export-ModuleMember -Function Get-LearningErrorActionPreference
Export-ModuleMember -Function Get-LearningErrorActionPreferenceWithPSCmdletVariable