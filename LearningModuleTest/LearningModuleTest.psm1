<# 
   .Synopsis 
    LearningModuleTest
     
   .Description
    LearningModule testing set

   .Notes 
    NAME  : LearningModuleTest.psm1*
    AUTHOR: raulg.    

    CREATED: 02/01/2021
#>

Write-Host "Loading LearningModuleTest ..." -ForegroundColor DarkCyan

<#
.SYNOPSIS
Control function to confirm testing process works
#>
function Test-Version {
    [CmdletBinding()] param ()

     Assert-IsTrue -Condition $true
}

<#
.SYNOPSIS
No throwing from function

.DESCRIPTION
Congrol function to ensure that the Trhow funciton works as expected and returns values when no throw
#>
function Test-Throwfunction_NoThrow {
    [CmdletBinding()] param ()

    $result  = Invoke-Throw

    Assert-IsNotNull -Object $result
}

<#
.SYNOPSIS
Throw on Begin section

.DESCRIPTION
Confirm that no return when throw on Beging
#>
function Test-Throwfunction_OnBegin {
    [CmdletBinding()] param ()

     $hasthrown = $false
     try {
         $result = Invoke-Throw -OnBeging
     }
     catch {
         $hasthrown = $true
         Assert-IsNull -Object $result
     }
     Assert-IsTrue -Condition $hasThrown
}

<#
.SYNOPSIS
Thorw on End

.DESCRIPTION
Confirm that the process section does not returnany value if throw happen on end section

#>
function Test-Throwfunction_OnEnd {
    [CmdletBinding()] param ()

     $hasthrown = $false
     try {
         $result = Invoke-Throw -OnEnd
     }
     catch {
         $hasthrown = $true
         Assert-IsNull -Object $result
     }
     Assert-IsTrue -Condition $hasThrown
}

<#
.SYNOPSIS
Throw on second process

.DESCRIPTION
Confirm that no return when processing and one process throw
#>
function Test-Throwfunction_OnProcess_Environment {
    [CmdletBinding()] param ()
    $VerbosePreference = 'Continue'
    $ErrorActionPreference = 'SilentlyContinue'

    $hasthrown = $false
    try {
        $result = 1..3 |  Invoke-Throw -OnProcess 2 
    }
    catch {
        $hasthrown = $true
        Assert-IsNull -Object $result
    }
    Assert-IsTrue -Condition $hasThrown

}

<#
.SYNOPSIS
Throw on processing with ErrorAction parameter

.DESCRIPTION
Confirm that even with ErrorAction SilentlyContinue a throw aborts exection with no return
#>
function Test-Throwfunction_OnProcess_ErrorAction_SilentlyContinue {
    [CmdletBinding()] param ()

    $hasthrown = $false
    try {
        $result = Invoke-Throw -OnProcess 1  -ErrorAction SilentlyContinue 
    }
    catch {
        $hasthrown = $true
        Assert-IsNull -Object $result
    }
    Assert-IsTrue -Condition $hasThrown

}

function Test-VerbosePreference_Default {
    [CmdletBinding()] param ()

     $result = Get-LearningVerbosePreference
     Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-VerbosePreference_Default_Verbose {
    [CmdletBinding()] param ()

     $result = Get-LearningVerbosePreference -Verbose
     Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-VerbosePreference_Default_Verbose_Recurse {
    [CmdletBinding()] param ()

     $result = Get-LearningVerbosePreference -Recurse -Verbose
     Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-VerbosePreference_Environment {
    [CmdletBinding()] param ()

    $VerbosePreference = 'Continue'

     $result = Get-LearningVerbosePreference 
     Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-VerbosePreference_Environment_Verbose {
    [CmdletBinding()] param ()

    $VerbosePreference = 'Continue'

     $result = Get-LearningVerbosePreference -Verbose
     Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-VerbosePreference_Environment_Verbose {
    [CmdletBinding()] param ()

    $VerbosePreference = 'Continue'

     $result = Get-LearningVerbosePreference -Recurse -Verbose
     Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-VerbosePreference_Environment_Nested {
    [CmdletBinding()] param ()

    $VerbosePreference = 'Continue'

     $result = Get-LearningVerbosePreference -Nested
     Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-VerbosePreference_Environment_Nested_Verbose {
    [CmdletBinding()] param ()

    $VerbosePreference = 'Continue'

     $result = Get-LearningVerbosePreference -Nested -Verbose 
     Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-ErrorActionPreference_Default {
    [CmdletBinding()] param ()

    $result = Get-LearningErrorActionPreference
    Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-ErrorActionPreference_Environment {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Inquire'

    $result = Get-LearningErrorActionPreference
    Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-ErrorActionPreference_Environment_Inquire {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreference -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'Inquire' -Presented $result
}

function Test-ErrorActionPreference_Environment_Inquire_Recurse {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreference -Recurse -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'Inquire' -Presented $result
}

function Test-ErrorActionPreference_Environment_Inquire_Nested {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreference -Nested -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-ErrorActionPreference_Environment_Inquire_Nested_Recurse {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreference -Nested -Recurse -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Default {
    [CmdletBinding()] param ()

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable
    Assert-AreEqual -Expected 'Continue' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Environment {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Inquire'

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable
    Assert-AreEqual -Expected 'Inquire' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Environment_Inquire {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Environment_Inquire_Recurse {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable -Recurse -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Environment_Inquire_Nested {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable -Nested -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}

function Test-ErrorActionPreference_PSCmdletVariable_Environment_Inquire_Nested_Recurse {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'SilentlyContinue'

    $result = Get-LearningErrorActionPreferenceWithPSCmdletVariable -Nested -Recurse -ErrorAction 'Inquire'
    Assert-AreEqual -Expected 'SilentlyContinue' -Presented $result
}


## ErrorWrite

<#
.SYNOPSIS
No throwing from function

.DESCRIPTION
Congrol function to ensure that the Trhow funciton works as expected and returns values when no throw
#>
function Test-WriteError_NoThrow {
    [CmdletBinding()] param ()

    $result  = Invoke-WriteError

    Assert-IsNotNull -Object $result
}

<#
.SYNOPSIS
Throw on Begin section

.DESCRIPTION
Confirm that no return when throw on Beging
#>
function Test-WriteError_OnBegin {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Continue'

    $result = Invoke-WriteError -OnBegin -ErrorAction SilentlyContinue -ErrorVariable Errors
    
    Assert-IsNotNull -Object $result
    Assert-Count -Expected 1 -Presented $Errors
    Assert-AreEqual -Expected 'OnBeging' -Presented $Errors[0].Exception.Message
}

<#
.SYNOPSIS
Error on End

.DESCRIPTION
Confirm that the process section return the values up to the error

#>
function Test-WriteError_OnEnd {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Continue'

    $result = Invoke-WriteError -OnEnd -ErrorAction SilentlyContinue -ErrorVariable Errors

    Assert-IsNotNull -Object $result
    Assert-Count -Expected 1 -Presented $Errors
    Assert-AreEqual -Expected 'OnEnd' -Presented $Errors[0].Exception.Message
}

function Test-WriteError_OnProcess {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Continue'

    $result = 1..5 | Invoke-WriteError -OnProcess 3 -ErrorAction SilentlyContinue -ErrorVariable Errors

    Assert-Count -Expected 5 -Presented $result
    Assert-Count -Expected 1 -Presented $Errors
    Assert-AreEqual -Expected ("OnProcess on count {0}" -f 3) -Presented $Errors[0].Exception.Message
}

function Test-WriteError_OnBegin_OnProcess_OnEnd {
    [CmdletBinding()] param ()

    $ErrorActionPreference = 'Continue'

    $result = 1..5 | Invoke-WriteError -OnProcess 3 -OnBegin -OnEnd -ErrorAction SilentlyContinue -ErrorVariable Errors

    Assert-Count -Expected 5 -Presented $result
    Assert-CountObjects -Expected 3 -Presented $Errors
    
    Assert-AreEqual -Expected 'OnBeging' -Presented $Errors[0].Exception.Message
    Assert-AreEqual -Expected ("OnProcess on count {0}" -f 3) -Presented $Errors[1].Exception.Message
    Assert-AreEqual -Expected 'OnEnd' -Presented $Errors[2].Exception.Message
}