[CmdletBinding()]
param ()

Import-Module -Name TestingHelper -Force

Test-Module -Name "LearningModule" Test-ErrorActionPreference_PSCmdletVariable_*